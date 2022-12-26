<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Mail;
use App\Mail\GenericNotification;
use App\Models\Contact;
use App\Models\Newsletter;

class FormController extends FrontController
{
    public function __contruct()
    {
        parent::__contruct();
    }

    public function testNotificationTheme()
    {
        $mailData = [
            'subject' => 'İletişim Formu',
            'preheader' => 'Lorem ipsum dolor sit amet',
            'content' => '<strong>Subject was here</strong><br><br>Biraz daha mesaj lorem ipsum dolor sit ametBiraz daha mesaj lorBiraz daha mesaj lorem ipsum dolor sit ametBiraz daha mesaj lorem ipsum dolor sit ametem ipsum Biraz daha mesaj lorem ipsum dolor sit ametdolor sit ametBiraz dBiraz daha mesaj lorem ipsum dolor sit ametaha mesaj lorem ipsum dolor sit amet',
            'contact_subject' => 'Subject was here',
            'type' => 'contact',
            'table' => [
                'Adı Soyadı' => 'Datasins',
                'Telefon Numarası' => '+90000000000',
                'E-Posta Adresi' => 'ugurakcil@gmail.com',
                'IP Adresi' => $_SERVER['REMOTE_ADDR']
                // 'Bilgi Dosyası' => '<a href="'.url('/').'/storage/uploadedfiles/'.$filename.'">Dosyayı İndir</a>'
            ],
            'access' => [
                'name' => 'Yönetim Paneline Git',
                'url' => url('/').'/admin/contacts/x'
            ]
        ];

        return view('emails.generic', $mailData);
    }

    public function saveContact(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'name' => 'required',
            'area_code' => 'required|max:5',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
            'email' => 'required|email:rfc,dns|max:255', // 'email' => 'required|email:rfc,dns|unique:contacts|max:255',
            'message' => 'required',
            //'file' => 'max:10000|mimes:doc,docx,pdf,jpg,jpeg,gif,png,txt',
	        'g-recaptcha-response' => 'required|captcha',
         ]);

         if ($validator->fails()) {
            return response()->json([
                'info' => __($validator->messages()->first()),
                'error' => true
            ]);
        }

        /* if($req->hasFile('file')) {
            $uploadedFile = $req->file('file');
            $filename = time().$uploadedFile->getClientOriginalName();

            Storage::disk('local')->putFileAs(
                'public/uploadedfiles/',
                $uploadedFile,
                $filename
            );

            $dbRowContact['filename'] = 'uploadedfiles/'.$filename;
            $mailTable['Ek dosya'] = '<a href="'.url('/').'/storage/uploadedfiles/'.$filename.'">Ek Dosyayı İndir</a>';
        }*/

        $dbRowContact = [
            'name' => $req->get('name'),
            'area_code' => '+'.$req->get('area_code'),
            'message' => $req->get('message'),
            'phone' => $req->get('phone'),
            'email' => $req->get('email'),
            //'file' => 'uploadedfiles/'.$filename
        ];

        $mailTable = [
            'Telefon Numarası' => '+'.$req->get('area_code').' '.$req->get('phone'),
            'E-Posta Adresi' => $req->get('email'),
            'IP Adresi' => $_SERVER['REMOTE_ADDR']
            // 'Bilgi Dosyası' => '<a href="'.url('/').'/storage/uploadedfiles/'.$filename.'">Dosyayı İndir</a>'
        ];

        $form = new Contact($dbRowContact);
        $form->save();

        $mailData = [
            'subject' => 'İletişim Formu',
            'preheader' => $req->get('message'),
            'content' => '<strong>'.$req->get('name').'</strong><br><br>'.$req->get('message'),
            'contact_subject' => $req->get('name'),
            'type' => 'contact',
            'table' => $mailTable,
            'access' => [
                'name' => 'Yönetim Paneline Git',
                'url' => url('/').'/admin/contacts/'.$form->id
            ]
        ];

        Mail::send(new GenericNotification($mailData));

        return response()->json([
            'info' => __("site.contact_form_saved"),
            'error' => false
        ]);
    }

    public function saveNewsletter(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'email' => 'required|email:rfc,dns|unique:newsletters|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'info' => __($validator->messages()->first()),
                'error' => true
            ]);
        }

        (new Newsletter([
            'email' => $req->get('email')
        ]))->save();

        return response()->json([
            'info' => __("site.newsletter_saved"),
            'error' => false
        ]);
    }
}
