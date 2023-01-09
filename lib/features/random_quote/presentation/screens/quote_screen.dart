import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/random_quote_cubit.dart';
import '../widgets/loading_widget.dart';
import '../widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
 

  _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
       @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        AppStrings.appName,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteLoadingQuote) {
          return const LoadingWidget();
        } else if (state is RandomQuoteError) {
          return  CustomErrorWidget(onPressed: () => _getRandomQuote(),);
        } else if (state is RandomQuoteLoaded) {
          return Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuoteContent(quote: state.quote),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => _getRandomQuote(),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () => _getRandomQuote(),
        child: _buildBodyContent(),
      ),
    );
  }
}
