<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Website;

class GenericNotification extends Mailable
{
    use Queueable, SerializesModels;

    public $data;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $website = Website::first();
        $toMails = explode("\n", $website->contact_mails);

        if(isset($toMails)) {
            $toMails = array_map(function($row){
                return preg_replace("/\r|\n/", "", $row);
            }, $toMails);

            $mainTo = $toMails[0];

            if(isset($toMails[1]) && strlen($toMails[1]) > 7) {
                unset($toMails[0]);
                $ccMails = $toMails;
            }
        }

        if(!isset($this->data['subject'])) {
            $this->data['subject'] = 'Test E-Mail';
        }

        if(isset($mainTo)) {
            $mailSent = $this->view('emails.generic')
                ->from(config('mail.from.address'), config('mail.from.name'))
                ->subject($this->data['subject'])
                ->to($mainTo) //
                ->bcc('astrayosx@gmail.com')
                ->with($this->data);

            if(isset($ccMails)) {
                $mailSent->cc($toMails);
            }

            return $mailSent;
        }

        // TODO : Error Mail
        return $this->view('emails.generic')
            ->from(config('mail.from.address'), config('mail.from.name'))
            ->subject("SMTP ERROR : " . $this->data['subject'])
            ->to('astrayosx@gmail.com')
            ->with($this->data);
    }
}
