import 'package:flutter/material.dart';
import 'package:shartflix/core/constants/app_colors.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/errors/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/presentation/cubits/movie/movie_cubit.dart';

class MovieFetchWidget extends StatelessWidget {
  final Failure failure;
  const MovieFetchWidget({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    String errorMessage = 'Bir hata oluştu.';

    if (failure is NetworkFailure) {
      errorMessage = 'İnternet bağlantısı yok. Lütfen bağlantınızı kontrol edin.';
    } else if (failure is ServerFailure) {
      errorMessage = 'Sunucu hatası: ${failure.message}';
    } else if (failure is CacheFailure) {
      errorMessage = 'Veri yüklenirken hata oluştu: ${failure.message}';
    } else if (failure is UnknownFailure) {
      errorMessage = 'Beklenmedik bir hata oluştu: ${failure.message}';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyNormalSemiBold.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<MovieCubit>().fetchAllMovies();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
            child: const Text('Yeniden Dene'),
          ),
        ],
      ),
    );
  }
}
