import 'package:cached_network_image/cached_network_image.dart';
import 'package:club/screens/editProfileScreen/editProfileCubit/edit_profile_cubit.dart';
import 'package:club/screens/editProfileScreen/editProfileCubit/edit_profile_state.dart';
import 'package:club/widgets/permission_popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class ChangeImageScreen extends StatelessWidget {
  const ChangeImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Center(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return SafeArea(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Photo Library'),
                              onTap: () {
                                Navigator.of(context).pop();
                                context
                                    .read<EditProfileCubit>()
                                    .getImageFromGallery(context);
                              }),
                          ListTile(
                            leading: const Icon(Icons.photo_camera),
                            title: const Text('Camera'),
                            onTap: () async {
                              Navigator.of(context).pop();
                              var cameraStatus =
                              await Permission.camera.status;

                              if (cameraStatus.isGranted) {
                                if (!context.mounted) {
                                  return;
                                } else {
                                  context
                                      .read<EditProfileCubit>()
                                      .getImageFromCamera(context);
                                }
                              } else {
                                await [Permission.camera].request();
                                if (await Permission
                                    .camera.status.isGranted) {
                                  if (!context.mounted) {
                                    return;
                                  } else {
                                    context
                                        .read<EditProfileCubit>()
                                        .getImageFromCamera(context);
                                  }
                                } else {
                                  if (!context.mounted) {
                                    return;
                                  } else {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) =>
                                        const PermissionDialog(
                                          title:
                                          "Please enable camera permission",
                                        ));
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: state.image != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.file(
                state.image!,
                fit: BoxFit.cover,
                width: 100.0,
                height: 100.0,
              ),
            )
                : Column(
              children: [
                CachedNetworkImage(
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover),
                          ),
                        ),
                    imageUrl: '',
                    placeholder: (context, url) => SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset(
                          'assets/images/user_icon.png'),
                    ),
                    errorWidget: (context, url, error) =>
                        SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Image.asset(
                            'assets/images/user_icon.png',
                          ),
                        )),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Update Profile Image",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
