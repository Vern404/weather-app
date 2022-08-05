import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/state/weather_cubit.dart';
import 'package:weather/state/weather_state.dart';
import 'package:weather/widgets/weather_information.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({required this.cityName, Key? key}) : super(key: key);
  final String cityName;
  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)..fetchWeather(cityName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Detail'),
      ),

      body: Center(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            bloc: cubit,
              builder: (context, state) {
                if (state is WeatherLoading){
                  return const CircularProgressIndicator();
                }
                if (state is WeatherLoaded){
                  return WeatherInformation(weatherModel: state.weatherModel);
                }
              return Text(
                state is WeatherError ?
                    state.errorMessage: 'Unknown error');
              }
          ),
        ),
    );
  }
}
