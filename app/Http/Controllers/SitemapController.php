<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SitemapController extends FrontController
{
    public function __contruct()
    {
        parent::__contruct();
    }

    public function sitemap($langSlug)
    {
        /*
        * Detect errors first secure layer
        if(strlen($websiteSlug) > 15) {
            dd('error: website is wrong');
        }
        * */

        $website = Website::first();

        if (!$website) {
            dd('error: website is wrong');
        }

        /*
        * Generic Defines
        * */
        $website = $website->translate($langSlug);
        $now = Carbon::now()->toAtomString();
        $url = url('/');
        $baseSlugs = [
            'website' => $website->slug,
            'lang' => $langSlug
        ];

        /*
        * pageNames defines data such as title, slug for pages like about us
        * */
        $pageSlugs = Page::select(['id', 'title', 'slug', 'redirect_url'])
            ->with('translations')->get();

        foreach ($pageSlugs as $pageSlugRow) {
            $pageNames[$pageSlugRow->id] = [
                'id' => $pageSlugRow->id,
                'title' => $pageSlugRow->getTranslatedAttribute('title', $langSlug, $langSlug),
                'slug' => $pageSlugRow->getTranslatedAttribute('slug', $langSlug, $langSlug)
            ];
        }

        $contentsStarter = [
            [route('home', $baseSlugs), 'Daily', '0.8']
        ];

        /*
        * Base & list Pages
        if($websiteSlug != 'hotels') {
            $contentsStarter = [
                [ route('home', $baseSlugs), 'Daily', '0.8' ]
            ];
        } else {
            $contentsStarter = [
                [ route('page', array_merge($baseSlugs, [ 'slug' => $pageNames[1]['slug'] ])), 'Weekly', '0.8' ],
                [ route('page', array_merge($baseSlugs, [ 'slug' => $pageNames[5]['slug'] ])), 'Weekly', '0.8' ]
            ];
        }
        * */

        $contents = array_merge($contentsStarter, []);

        /*
        $contents = array_merge($contentsStarter, [
            [ route('rooms', $baseSlugs), 'Weekly', '0.8' ],
            [ route('blogList', $baseSlugs), 'Weekly', '0.8' ],
            [ route('company', $baseSlugs), 'Weekly', '0.8' ],
        ]);
        */

        /*
        * Blog Posts
        if($websiteSlug == 'hotels') {
            $blogPosts = BlogContent::select('id', 'title', 'image', 'excerpt', 'slug', 'website_id')
                ->ordered()
                ->get()
                ->translate($langSlug);

            foreach($blogPosts as $post) {
                array_push($contents, [
                    route('blogPost', array_merge($baseSlugs, ['slug' => $post->slug])),
                    'Weekly',
                    '0.8'
                ]);
            }
        }
        * */


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

        if ($langSlug != 'tr') {
            $url .= '/' . $langSlug;
        }

        $output = '
        <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
            <url>
                <loc>' . $url . '</loc>
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
        $output = '<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet type="text/xsl" href="//www.WEBSITENAME.com/sitemap-style.xsl"?>
			<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
				<sitemap>
					<loc>https://www.WEBSITENAME.com/sitemap/tr.xml</loc>
					<lastmod>2022-11-08T13:43:16+00:00</lastmod>
				</sitemap>
				<sitemap>
					<loc>https://www.WEBSITENAME.com/sitemap/en.xml</loc>
					<lastmod>2022-11-08T13:43:16+00:00</lastmod>
				</sitemap>
			</sitemapindex>
			<!-- XML Sitemap generated by @ugurakcil -->';

        return response($output)->header('Content-Type', 'application/xml');
    }
}
