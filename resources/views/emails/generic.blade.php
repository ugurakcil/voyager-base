<!doctype html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>{{ setting(app()->getLocale().'.title') }}</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic&subset=latin,latin-ext);

        /* -------------------------------------
            GLOBAL RESETS
        ------------------------------------- */
        img {
            border: none;
            -ms-interpolation-mode: bicubic;
            max-width: 100%;
        }

        body {
            background: #91dfd6;
            font-family: 'Lato', Arial, sans-serif;
            -webkit-font-smoothing: antialiased;
            font-size: 17px;
            line-height: 1.4;
            margin: 0;
            padding: 0;
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
            width: 100%;
        }

        table {
            font-family: 'Lato', Arial, sans-serif;
            border-collapse: separate;
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
            width: 100%;
        }

        table td {
            font-family: 'Lato', Arial, sans-serif;
            font-size: 17px;
            vertical-align: top;
        }

        /* -------------------------------------
            BODY & CONTAINER
        ------------------------------------- */

        table.body{
            background: #91dfd6;
            width: 100%;
        }


        /* Set a max-width, and make it display as block
            so it will automatically stretch to that width,
            but will also shrink down on a phone or something */
        .container {
            display: block;
            margin: 0 auto !important;
            /* makes it centered */
            max-width: 580px;
            padding: 10px;
            width: 580px;
        }

        /* This should also be a block element,
            so that it will fill 100% of the .container */
        .content {
            box-sizing: border-box;
            display: block;
            margin: 0 auto;
            max-width: 580px;
            padding: 10px;
        }

        /* -------------------------------------
            HEADER, FOOTER, MAIN
        ------------------------------------- */
        .main {
            background: #ffffff;
            border-radius: 3px;
            width: 100%;
        }

        .wrapper {
            box-sizing: border-box;
            padding: 20px;
        }

        .content-block {
            padding-bottom: 10px;
            padding-top: 10px;
        }

        .footer {
            clear: both;
            margin-top: 10px;
            text-align: center;
            width: 100%;
        }

        .footer td,
        .footer p,
        .footer span,
        .footer a {
            color: #102724;
            font-size: 13px;
            text-align: center;
        }

        /* -------------------------------------
            TYPOGRAPHY
        ------------------------------------- */
        h1,
        h2,
        h3,
        h4 {
            color: #000000;
            font-family: 'Lato', Arial, sans-serif;
            font-weight: 400;
            line-height: 1.4;
            margin: 0;
            padding-bottom: 30px;
            margin-bottom: 15px;
            border-bottom:1px solid #ddf1ea;
        }

        h1 {
            font-size: 35px;
            font-weight: 300;
            text-align: center;
            text-transform: capitalize;
        }

        p,
        ul,
        ol {
            font-family: 'Lato', Arial, sans-serif;
            font-size: 15px;
            font-weight: normal;
            margin: 0;
            margin-bottom: 15px;
        }

        p li,
        ul li,
        ol li {
            list-style-position: inside;
            margin-left: 5px;
        }

        a {
            color: #3498db;
            text-decoration: underline;
        }

        /* -------------------------------------
            BUTTONS
        ------------------------------------- */
        .btn {
            box-sizing: border-box;
            width: 100%;
        }

        .btn>tbody>tr>td {
            padding-bottom: 15px;
        }

        .btn table {
            width: auto;
        }

        .btn table td {
            background-color: #ffffff;
            border-radius: 5px;
            text-align: center;
        }

        .btn a {
            background-color: #ffffff;
            border: solid 1px #fec526;
            border-radius: 5px;
            box-sizing: border-box;
            color: #FFF;
            cursor: pointer;
            display: inline-block;
            font-size: 17px;
            font-weight: bold;
            margin: 0;
            padding: 12px 25px;
            text-decoration: none;
            text-transform: capitalize;
        }

        .btn-primary {
            padding: 10px 20px;
            background-color: #102724;
            border-color: #18423d;
            color: #4cebd9 !important;
            text-decoration: none;
            border-radius:5px;
        }

        /* -------------------------------------
            OTHER STYLES THAT MIGHT BE USEFUL
        ------------------------------------- */
        .last {
            margin-bottom: 0;
        }

        .first {
            margin-top: 0;
        }

        .align-center {
            text-align: center;
        }

        .align-right {
            text-align: right;
        }

        .align-left {
            text-align: left;
        }

        .clear {
            clear: both;
        }

        .mt0 {
            margin-top: 0;
        }

        .mb0 {
            margin-bottom: 0;
        }

        .preheader {
            color: transparent;
            display: none;
            height: 0;
            max-height: 0;
            max-width: 0;
            opacity: 0;
            overflow: hidden;
            mso-hide: all;
            visibility: hidden;
            width: 0;
        }

        .powered-by a {
            text-decoration: none;
        }

        hr {
            border: 0;
            border-bottom: 1px solid #f6f6f6;
            Margin: 20px 0;
        }

        /* -------------------------------------
            RESPONSIVE AND MOBILE FRIENDLY STYLES
        ------------------------------------- */
        @media only screen and (max-width: 620px) {
            table[class=body] h1 {
                font-size: 28px !important;
                margin-bottom: 10px !important;
            }

            table[class=body] p,
            table[class=body] ul,
            table[class=body] ol,
            table[class=body] td,
            table[class=body] span,
            table[class=body] a {
                font-size: 17px !important;
            }

            table[class=body] .wrapper,
            table[class=body] .article {
                padding: 10px !important;
            }

            table[class=body] .content {
                padding: 0 !important;
            }

            table[class=body] .container {
                padding: 0 !important;
                width: 100% !important;
            }

            table[class=body] .main {
                border-left-width: 0 !important;
                border-radius: 0 !important;
                border-right-width: 0 !important;
            }

            table[class=body] .btn table {
                width: 100% !important;
            }

            table[class=body] .btn a {
                width: 100% !important;
            }

            table[class=body] .img-responsive {
                height: auto !important;
                max-width: 100% !important;
                width: auto !important;
            }
        }

        /* -------------------------------------
            PRESERVE THESE STYLES IN THE HEAD
        ------------------------------------- */
        @media all {
            .ExternalClass {
                width: 100%;
            }

            .ExternalClass,
            .ExternalClass p,
            .ExternalClass span,
            .ExternalClass font,
            .ExternalClass td,
            .ExternalClass div {
                line-height: 100%;
            }

            .apple-link a {
                color: inherit !important;
                font-family: inherit !important;
                font-size: inherit !important;
                font-weight: inherit !important;
                line-height: inherit !important;
                text-decoration: none !important;
            }

            .btn-primary:hover {
                background-color: #53585a !important;
                border-color: #53585a !important;
            }
        }

        .table-list {
            /*
            border-spacing: 1em;
            border-collapse: separate;
            */
        }
        strong{
            color: #106156;
        }

        .table-list tr td{
            border-bottom:1px solid #c4d7d5;
        }

        .message{
            font-size:17px;
            border-left:3px solid #91dfd6;
            padding-left:15px;
        }
        .message-table{
            background-color: #f1f7f6;
        }
    </style>
</head>
<body class="">
    <table border="0" cellpadding="0" cellspacing="0" class="body">
        <tr>
            <td>&nbsp;</td>
            <td class="container">
                <div class="content">

                    <!-- START CENTERED WHITE CONTAINER -->
                    <span class="preheader">{!!$preheader!!}</span>
                    <table class="main">

                        <!-- START MAIN CONTENT AREA -->
                        <tr>
                            <td class="wrapper">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <p>
                                                <center>
                                                    <h1>{{ setting(app()->getLocale().'.title') }} Web Form</h1>
                                                </center>
                                            </p>

                                            <table border="0" cellpadding="25" cellspacing="0" class="message-table">
                                                <tr>
                                                    <td>
                                                        <p>
                                                            <div class="message">
                                                                {!!$content!!}
                                                            </div>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </table>

                                            @isset($table)
                                            <table class="table-list" border="0" cellpadding="15" cellspacing="0">
                                                @foreach ($table as $key => $item)
                                                <tr>
                                                    <td width="42%"><strong>{!!$key!!}</strong></td>
                                                    <td>{!!$item!!}</td>
                                                </tr>
                                                @endforeach
                                            </table>
                                            @endisset

                                            <br>

                                            @isset($access)
                                            <center style="margin:23px;">
                                                <a class="btn btn-primary" href="{{$access['url']}}" target="_blank">{!!$access['name']!!}</a>
                                            </center>
                                            @endisset


                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <!-- END MAIN CONTENT AREA -->
                    </table>

                    <!-- START FOOTER -->
                    <div class="footer">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="content-block">
                                    <span class="apple-link">{{ setting(app()->getLocale().'.title') }}</span>
                                    <br> Don't like these emails? <a href="#">Unsubscribe</a>.
                                </td>
                            </tr>
                            {{--<tr>
                                <td class="content-block powered-by">
                                    Powered by <a href="https://www.ooo">ZEDMAN | O</a>.
                                </td>
                            </tr>--}}
                        </table>
                    </div>
                    <!-- END FOOTER -->

                    <!-- END CENTERED WHITE CONTAINER -->
                </div>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</body>
</html>
