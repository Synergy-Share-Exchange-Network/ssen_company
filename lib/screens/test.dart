  // if (companyReceiptImage != null) {
  //     String photoURL = await FirebaseStorageMethods().uploadImageToStorage(
  //         "logo/${purchase.identification}/image/${const Uuid().v1()}",
  //         companyReceiptImage!);
  //     if (!kIsWeb) {
  //       String thumbnailsPhotoURL = await FirebaseStorageMethods()
  //           .uploadImageToStorageThumbnails(
  //               "logo/${purchase.identification}/thumbnail/${const Uuid().v1()}",
  //               companyReceiptImage!);
  //       photoURLWithThumbnails4 = '$photoURL<thumbnail>$thumbnailsPhotoURL';
  //     } else {
  //       photoURLWithThumbnails4 = '$photoURL<thumbnail>$photoURL';
  //     }
  //   }