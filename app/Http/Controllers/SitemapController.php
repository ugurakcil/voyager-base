<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Website;
use Carbon\Carbon;

use App\Models\Page;
use App\Models\Post;
use App\Models\Category;
use App\Models\Tag;

class SitemapController extends FrontController
{
    public function __contruct()
    {
        parent::__contruct();
    }

    public function sitemap($langSlug)
    {
        $mainLocale = array_key_first(\Config::get('app.available_locales'));

        /*
        * Detect errors first secure layer
        * */
        if(!array_key_exists($langSlug, \Config::get('app.available_locales'))){
            return abort(403, 'Language not supported.');
        }

        $website = Website::first();

        if (!$website) {
            dd('error: website is wrong');
        }

        /*
        * Generic Defines
        * */
        $website = $website->translate($langSlug);
        $now = Carbon::now()->toAtomString();
        $mainUrl = url('/');
        $baseSlugs = [
            //'website' => $website->slug,
            'lang' => $langSlug
        ];

        $contents = [];

        if($langSlug != $mainLocale) {
            $mainUrl.= '/'.$langSlug;
        }

        /*
        * pageNames defines data such as title, slug for pages like about us
        * */
        $pages = Page::select(['id', 'title', 'slug', 'redirect_url'])
            ->get()
            ->translate($langSlug);

        foreach ($pages as $page) {
            array_push($contents, [
                route('page', array_merge($baseSlugs, ['slug' => $page->slug])),
                'Weekly',
                '0.8'
            ]);
        }

        /*
        * Categories
        * */
        $categories = Category::select('id', 'title', 'slug')
            ->ordered()
            ->get()
            ->translate($langSlug);

        foreach($categories as $category) {
            array_push($contents, [
                route('category', array_merge($baseSlugs, ['slug' => $category->slug])),
                'Daily',
                '0.8'
            ]);
        }

        /*
        * Posts
        * */
        $posts = Post::select('id', 'title', 'image', 'excerpt', 'slug')
            ->active()
            ->ordered()
            ->get()
            ->translate($langSlug);

        foreach($posts as $post) {
            array_push($contents, [
                route('post', array_merge($baseSlugs, ['slug' => $post->slug])),
                'Weekly',
                '0.8'
            ]);
        }

        /*
        * Tags
        * Etiketler çok fazla olacağı için ayrı bir xml grubunda toplanabilir,
        * ya da hiç gösterilmemesi seo açısından daha verimli olabilir
        * */
        /*
        $tags = Tag::select('id', 'title', 'slug')
            ->orderBy('id','desc') // must be updated_at triggered by content
            ->limit(200)
            ->get()
            ->translate($langSlug);

        foreach($tags as $tag) {
            array_push($contents, [
                route('tag', array_merge($baseSlugs, ['slug' => $tag->slug])),
                'Monthly',
                '0.8'
            ]);
        }
        */
        // Taglerin sitemap ile alınmasının seo faydası yok

        $contentInside = '';
        foreach ($contents as $row) {
            $contentInside .= '<url>';
            $contentInside .= '<loc>' . $row[0] . '</loc>';
            if (isset($row[1]) && $row[1] !== false) {
                $contentInside .= '<changefreq>' . $row[1] . '</changefreq>';
            }
            if (isset($row[2]) && $row[2] !== false) {
                $contentInside .= '<changefreq>' . $row[2] . '</changefreq>';
            }
            if (isset($row[3]) && $row[3] !== false) {
                $contentInside .= '<lastmod>' . $row[3] . '</lastmod>';
            }
            $contentInside .= '</url>';
        }

        $output = '
        <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
            <url>
                <loc>' . $mainUrl . '</loc>
                <changefreq>Daily</changefreq>
                <priority>0.8</priority>
                <lastmod>' . $now . '</lastmod>
            </url>
            ' . $contentInside . '
        </urlset>';

        return response($output)->header('Content-Type', 'application/xml');
    }

    public function allSitemaps()
    {
        $output = '<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/xsl" href="//'.request()->host().'/sitemap-style.xsl"?>
			<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

        foreach(\Config::get('app.available_locales') as $loopLocale) {
            $output .= '
            <sitemap>
                <loc>'.url('/sitemap/'.$loopLocale.'.xml').'</loc>
                <lastmod>2022-11-08T13:43:16+00:00</lastmod>
            </sitemap>';
        }

        $output .= '
        </sitemapindex>
        <!-- XML Sitemap generated by @datasins -->';

        return response($output)->header('Content-Type', 'application/xml');
    }
}
