import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as path;

class FirebaseStorageService {
 static Future<Uri> uploadImageToFirebaseAndShareDownloadUrl(
      MediaInfo info, String yol) async {
    String mimeType = mime(path.basename(info.fileName));
    final extension = extensionFromMime(mimeType);
    var metadata = fb.UploadMetadata(
      contentType: mimeType,
    );
    fb.StorageReference ref = fb
        .app()
        .storage()
       // .refFromURL('gs://your-projecct-url.com')
        .ref(
            "images/$yol/images_${DateTime.now().millisecondsSinceEpoch}.${extension}");
    fb.UploadTask uploadTask = ref.put(info.data, metadata);
    fb.UploadTaskSnapshot taskSnapshot = await uploadTask.future;
    return taskSnapshot.ref.getDownloadURL();
  }
   /*
     Future<Uri> uploadFile(
          MediaInfo mediaInfo, String ref, String fileName) async {
        try {
          String mimeType = mime(path.basename(mediaInfo.fileName));

          // html.File mediaFile =
          //     new html.File(mediaInfo.data, mediaInfo.fileName, {'type': mimeType}); 
          final String extension = extensionFromMime(mimeType);

          var metadata = fb.UploadMetadata(
            contentType: mimeType,
          );

          fb.StorageReference storageReference =
              fb.storage().ref(ref).child(fileName + ".$extension");

          fb.UploadTaskSnapshot uploadTaskSnapshot =
              await storageReference.put(mediaInfo.data, metadata).future;

          Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
          print("download url $imageUri");
          return imageUri;
        } catch (e) {
          print("File Upload Error $e");
          return null;
        }
      }
  */
  }