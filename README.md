# nubankproducts

A Flutter app where users spend their NuConta balance on awesome products.

# Running the project
The project was written in Flutter/Dart so it can be run having Flutter/Dart installed on your machine and running "flutter run".

# Why didn't I use bloc?
Everyone knows that BLoC is one of the favorites flutter patterns and it is widely used by the industry. 
I tried to write the solution as simples as possible. Taking this into account, there was no need to manually manage state between different widgets and that is the reason why I prefer not to use BLoCs in this project. I have chosen to use the default GraphQLProvider and their Query Widget which already deals with exception and loading.

I have written a bloc (marketplace_bloc), but in the end, I choose not to use it because of these simplicity reasons.

# Project structure

I tried to divide everything I could into individual widgets in the widgets folder. For example, you can see a Widget that receives a Customer object and build its customer balance and info. 



