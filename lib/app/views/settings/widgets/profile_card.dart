import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';

class ProfileCard extends StatelessWidget {
  final String displayName;
  final String email;
  final String? photoUrl;
  final bool isUploading;
  final VoidCallback onUploadImageTap;
  final VoidCallback onEditNameTap;

  const ProfileCard({
    super.key,
    required this.displayName,
    required this.email,
    this.photoUrl,
    required this.isUploading,
    required this.onUploadImageTap,
    required this.onEditNameTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.05),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: context.colorScheme.primary.withOpacity(0.1),
                backgroundImage: photoUrl != null
                    ? (photoUrl!.startsWith('http')
                        ? NetworkImage(photoUrl!) as ImageProvider
                        : MemoryImage(base64Decode(photoUrl!)) as ImageProvider)
                    : null,
                child: photoUrl == null
                    ? Text(
                        displayName.isNotEmpty
                            ? displayName.substring(0, 1).toUpperCase()
                            : (email.isNotEmpty ? email.substring(0, 1).toUpperCase() : '?'),
                        style: context.textTheme.headlineMedium?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              if (isUploading)
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                )
              else
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onUploadImageTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        displayName.isNotEmpty ? displayName : 'Kullanıcı',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit_rounded,
                        size: 18,
                        color: context.colorScheme.primary,
                      ),
                      onPressed: onEditNameTap,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
