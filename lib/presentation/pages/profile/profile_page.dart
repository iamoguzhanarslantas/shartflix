import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import for .w and .h
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_dimensions.dart'; // Import AppDimensions
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/constants/app_strings.dart'; // Import AppStrings
import 'package:go_router/go_router.dart';
import 'package:shartflix/domain/entities/user_entity.dart';
import 'package:shartflix/application/usecases/auth/auth_bloc.dart'; // Use AuthBloc
import 'package:shartflix/presentation/pages/auth/login_page.dart';
import 'package:shartflix/presentation/widgets/common/app_layout.dart';
import 'package:shartflix/presentation/widgets/profile/limited_offer_button.dart';
import 'package:shartflix/presentation/widgets/profile/add_photo_button.dart';
import 'package:shartflix/presentation/pages/auth/profile_photo_upload_page.dart';
import 'package:shartflix/presentation/cubits/favorite_movie/favorite_movie_cubit.dart'; // Import FavoriteMovieCubit
import 'package:shartflix/presentation/widgets/profile/liked_movie_card.dart'; // Import LikedMovieCard

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppLayout(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              context.go(LoginPage.routeName);
            } else if (state is AuthAuthenticated) {
              // Fetch favorite movies when authenticated and ProfilePage is built
              context.read<FavoriteMovieCubit>().fetchFavoriteMovies();
            }
          },
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              context.read<FavoriteMovieCubit>().fetchFavoriteMovies();
            }
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    width: AppDimensions.navBarWidth.w,
                    height: AppDimensions.profileAppBarHeight.h,
                    padding: EdgeInsets.only(
                      top: AppDimensions.profileAppBarPaddingTop.h,
                      right: AppDimensions.profileAppBarPaddingRight.w,
                      bottom: AppDimensions.profileAppBarPaddingBottom.h,
                      left: AppDimensions.profileAppBarPaddingLeft.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.profile,
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const LimitedOfferButton(), // Use the extracted widget
                      ],
                    ),
                  ),
                  // New Profile Info Row
                  Container(
                    width: AppDimensions
                        .navBarWidth
                        .w, // Assuming same width as navBar
                    height: AppDimensions.profileInfoRowHeight.h,
                    padding: EdgeInsets.only(
                      top: AppDimensions.profileInfoRowPaddingTop.h,
                      right: AppDimensions.profileInfoRowPaddingRight.w,
                      bottom: AppDimensions.profileInfoRowPaddingBottom.h,
                      left: AppDimensions.profileInfoRowPaddingLeft.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.white05,
                          width: AppDimensions.profileInfoRowBorderWidth.w,
                        ),
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (state is AuthAuthenticated) {
                          final UserEntity user = state.user;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Profile Image
                              CircleAvatar(
                                radius: AppDimensions.profileAvatarRadius.r,
                                child:
                                    user.photoUrl != null &&
                                        user.photoUrl!.isNotEmpty
                                    ? ClipOval(
                                        child: Image.network(
                                          user.photoUrl!,
                                          fit: BoxFit.cover,
                                          width:
                                              AppDimensions
                                                  .profileAvatarRadius
                                                  .r *
                                              2,
                                          height:
                                              AppDimensions
                                                  .profileAvatarRadius
                                                  .r *
                                              2,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                    : null,
                                                color: AppColors.white,
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Icon(
                                                  Icons.person,
                                                  size: AppDimensions
                                                      .profileAvatarRadius
                                                      .r,
                                                  color: AppColors.white,
                                                );
                                              },
                                        ),
                                      )
                                    : Icon(
                                        Icons.person,
                                        size:
                                            AppDimensions.profileAvatarRadius.r,
                                        color: AppColors.white,
                                      ),
                              ),
                              SizedBox(
                                width: AppDimensions.profileInfoRowGap.w,
                              ),
                              // Name and Email Column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  user.name!.length > 13
                                      ? Text(
                                          user.name?.substring(0, 13) ?? 'N/A',
                                          style: AppTextStyles.bodyLargeSemiBold
                                              .copyWith(
                                                color: AppColors.white,
                                                fontSize: AppDimensions
                                                    .profileNameFontSize
                                                    .sp,
                                              ),
                                        )
                                      : Text(
                                          user.name ?? 'N/A',
                                          style: AppTextStyles.bodyLargeSemiBold
                                              .copyWith(
                                                color: AppColors.white,
                                                fontSize: AppDimensions
                                                    .profileNameFontSize
                                                    .sp,
                                              ),
                                        ),
                                  SizedBox(
                                    height: AppDimensions
                                        .profileNameEmailColumnGap
                                        .h,
                                  ),
                                  Text(
                                    "ID: ${user.id?.substring(0, 6) ?? 'N/A'}",
                                    style: AppTextStyles.bodyNormalMedium
                                        .copyWith(
                                          color: AppColors.white60,
                                          fontSize: AppDimensions
                                              .profileEmailFontSize
                                              .sp,
                                        ),
                                  ),
                                ],
                              ),
                              const Spacer(), // Pushes the button to the right
                              // Add Photo Button
                              AddPhotoButton(
                                onPressed: () {
                                  context.go(ProfilePhotoUploadPage.routeName);
                                },
                              ),
                            ],
                          );
                        } else if (state is AuthLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'Please log in to view your profile.',
                              style: AppTextStyles.bodyLargeRegular.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  // The rest of the profile content will go here, currently empty
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (state is AuthAuthenticated) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppDimensions
                                    .likedMoviesSectionTopPadding
                                    .h,
                              ),
                              // Liked Movies Section Title (fixed)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppDimensions.profileAppBarPaddingLeft.w,
                                ),
                                child: Text(
                                  AppStrings.likedMovies,
                                  style: AppTextStyles.bodyXLargeSemiBold
                                      .copyWith(
                                        color: AppColors.white,
                                        fontSize: AppDimensions
                                            .likedMoviesTitleFontSize
                                            .sp,
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.likedMoviesSectionGap.h,
                              ),
                              // Liked Movies Grid (scrollable)
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDimensions
                                          .profileAppBarPaddingLeft
                                          .w,
                                    ), // Reusing horizontal padding
                                    child: BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
                                      builder: (context, movieState) {
                                        if (movieState is FavoriteMovieLoading) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (movieState is FavoriteMovieLoaded) {
                                          final likedMovies = movieState.movies;
                                          if (likedMovies.isEmpty) {
                                            return Center(
                                              child: Text(
                                                'Henüz beğendiğiniz film yok.',
                                                style: AppTextStyles
                                                    .bodyNormalRegular
                                                    .copyWith(
                                                      color: AppColors.white60,
                                                    ),
                                              ),
                                            );
                                          }
                                          return GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: AppDimensions
                                                      .likedMoviesGridItemGap
                                                      .w,
                                                  mainAxisSpacing: AppDimensions
                                                      .likedMoviesGridItemGap
                                                      .h,
                                                  childAspectRatio:
                                                      AppDimensions
                                                          .likedMovieCardWidth /
                                                      AppDimensions
                                                          .likedMovieCardHeight,
                                                ),
                                            itemCount: likedMovies.length,
                                            itemBuilder: (context, index) {
                                              final movie = likedMovies[index];
                                              return LikedMovieCard(
                                                movie: movie,
                                              );
                                            },
                                          );
                                        } else if (movieState is FavoriteMovieError) {
                                          return Center(
                                            child: Text(
                                              'Beğenilen filmler yüklenirken hata oluştu: ${movieState.failure.message}',
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles
                                                  .bodyNormalRegular
                                                  .copyWith(
                                                    color: AppColors.primary,
                                                  ),
                                            ),
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (state is AuthLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'Please log in to view your profile.',
                              style: AppTextStyles.bodyLargeRegular.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
