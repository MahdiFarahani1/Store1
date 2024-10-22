import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:image/image.dart' as Img;
import 'package:screenshot/screenshot.dart';

class RepositoryPirint {
  static Uint8List? bytesConvert;
  static Uint8List? bytesConvert2;

  static ScreenshotController screenshotControllerHeader =
      ScreenshotController();
  static ScreenshotController screenshotControllerFooter =
      ScreenshotController();

  static Future<List<int>> testTicket() async {
    List<int> bytes = [];
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    bytes += generator.reset();

    final ByteData data = await rootBundle.load(Assets.images.topPrint.path);
    final Uint8List bytesImg2 = data.buffer.asUint8List();
    final image2 = Img.copyResize(
      Img.decodeImage(bytesImg2)!,
      width: 110,
      height: 80,
    ); // final Uint8List bytesImg = bytesConvert!;
    // final image = Img.decodeImage(
    //   bytesImg,
    // );
    bytes += generator.image(
      image2,
      align: PosAlign.center,
    );
    bytes += generator.text('________________________________',
        styles: const PosStyles(
          align: PosAlign.center,
        ));
    final Uint8List bytesImg = bytesConvert!;
    final image = Img.decodeImage(
      bytesImg,
    );
    bytes += generator.image(image!);

    bytes += generator.text('________________________________',
        styles: const PosStyles(
          align: PosAlign.center,
        ));
    bytes += generator.text('');
    bytes += generator.text('Terminal ID: 424',
        styles: const PosStyles(
          fontType: PosFontType.fontB,
          align: PosAlign.left,
        ));
    bytes += generator.text('Time: 2024 - 10 - 21   15:22:30',
        styles: const PosStyles(
          align: PosAlign.left,
          fontType: PosFontType.fontB,
        ));
    bytes += generator.text('Order Number: 63704932',
        styles: const PosStyles(
          fontType: PosFontType.fontB,
          align: PosAlign.left,
        ));
    bytes += generator.text('');
    final ByteData data4 = await rootBundle.load(Assets.images.test5.path);
    final Uint8List bytesImg4 = data4.buffer.asUint8List();
    final image4 = Img.copyResize(
      Img.decodeImage(bytesImg4)!,
      width: 300,
      height: 150,
    );
    bytes += generator.image(
      image4,
      align: PosAlign.center,
    );
    bytes += generator.text('Asiacell 5000',
        styles: const PosStyles(
          fontType: PosFontType.fontA,
          bold: true,
          align: PosAlign.center,
        ));
    bytes += generator.text('');
    bytes += generator.text('SN: 9826475501264537',
        styles: const PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
        ));
    bytes += generator.text('PIN Code:',
        styles: const PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
        ));
    bytes += generator.text('7326598712042857',
        styles: const PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
            align: PosAlign.left,
            bold: true));
    bytes += generator.text('----------------------------',
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.qrcode('example.com');
    bytes += generator.text('----------------------------',
        styles: const PosStyles(align: PosAlign.center));
    final Uint8List bytesImg3 = bytesConvert2!;
    final image3 = Img.decodeImage(
      bytesImg3,
    );
    bytes += generator.image(image3!);
    // bytes += generator.text('Special 1: ñÑ àÀ èÈ éÉ üÜ çÇ ôÔ',
    //     styles: const PosStyles(codeTable: 'CP1252'));
    // bytes += generator.text(
    //   'Special 2: blåbærgrød',
    //   styles: const PosStyles(codeTable: 'CP1252'),
    // );

    // bytes +=
    //     generator.text('Reverse text', styles: const PosStyles(reverse: true));
    // bytes += generator.text('Underlined text',
    //     styles: const PosStyles(underline: true), linesAfter: 1);
    // bytes += generator.text('Align left',
    //     styles: const PosStyles(align: PosAlign.left));
    // bytes += generator.text('Align center',
    //     styles: const PosStyles(align: PosAlign.center));
    // bytes += generator.text('Align right',
    //     styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

    // bytes += generator.row([
    //   PosColumn(
    //     text: 'col3',
    //     width: 3,
    //     styles: const PosStyles(align: PosAlign.center, underline: true),
    //   ),
    //   PosColumn(
    //     text: 'col6',
    //     width: 6,
    //     styles: const PosStyles(align: PosAlign.center, underline: true),
    //   ),
    //   PosColumn(
    //     text: 'col3',
    //     width: 3,
    //     styles: const PosStyles(align: PosAlign.center, underline: true),
    //   ),
    // ]);

    // //barcode
    // final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    // bytes += generator.barcode(Barcode.upcA(barData));

    // //QR code

    // bytes += generator.text(
    //   'Text size 50%',
    //   styles: const PosStyles(
    //     fontType: PosFontType.fontB,
    //   ),
    // );
    // bytes += generator.text(
    //   'Text size 100%',
    //   styles: const PosStyles(
    //     fontType: PosFontType.fontA,
    //   ),
    // );
    // bytes += generator.text(
    //   'Text size 200%',
    //   styles: const PosStyles(
    //     height: PosTextSize.size2,
    //     width: PosTextSize.size2,
    //   ),
    // );

    bytes += generator.feed(2);
    return bytes;
  }

  static Future<void> convertWidgetToImage() async {
    bytesConvert = await screenshotControllerHeader.capture();
    bytesConvert2 = await screenshotControllerFooter.capture();

    if (bytesConvert != null) {
      if (kDebugMode) {
        print("Image captured!");
      }
    } else {
      if (kDebugMode) {
        print("Failed to capture image.");
      }
    }
  }
}
