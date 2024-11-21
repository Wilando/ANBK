<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\File;

class FileController extends Controller
{
    //

    public function index($slashData = null)
    {
        if ($slashData == null) {
            abort(404);
        }

        if (!Storage::disk('public')->exists($slashData)) {
            abort(404);
        }

        $file = Storage::disk('public')->path($slashData);
        if (file_exists($file)) {
            return response()->file($file);
        }
    }

    public function callJs($slashData = null)
    {
        if ($slashData == null) {
            abort(404);
        }
        $absolutePath = base_path('resources/js/myjs/' . $slashData);
        if (file_exists($absolutePath)) {


            if ($absolutePath !== null) {
//                $extension = pathinfo($absolutePath, PATHINFO_EXTENSION);
//                if ($extension === 'css') {
//                    $contentType = 'text/css';
//                } else {
                $contentType = 'application/javascript';
                $cachedTimestamp = cache($slashData);
                $serverTimestamp = File::lastModified($absolutePath);
//                cache()->put($slashData, $serverTimestamp);
                if ($cachedTimestamp == $serverTimestamp) {
                    // Gunakan versi yang ada di cache
                    $scriptContents = cache($slashData.'.content');
                    return response($scriptContents)->header('Content-Type', $contentType);


                } else {
                    // Simpan versi terbaru ke dalam cache
                    $scriptContents = file_get_contents($absolutePath);
                    cache()->put($slashData, $serverTimestamp);
                    cache()->put($slashData.'.content', $scriptContents);
//                    cache([$slashData => $serverTimestamp, 'testingajani' => $absolutePath], 60); // Cache selama 60 menit
                    return response()->file($absolutePath, ['Content-Type' => $contentType]);

                }


//                }

            } else {
                return response()->json(['error' => 'File not found'], 404);
            }
        } else {
            abort(404);
        }
    }
}
