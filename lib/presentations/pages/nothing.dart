// @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       Padding(
//         padding: EdgeInsets.only(
//             left: screenUtil.setWidth(20), right: screenUtil.setWidth(16)),
//         child: buildContainerHeader(context),
//       ),
//       const SizedBox(height: 10), // Add some spacing
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
//             .map((day) => Expanded(
//           child: Center(
//             child: Text(
//               day,
//               style: TextStyle(
//                 fontSize: screenUtil.setSp(16),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ))
//             .toList(),
//       ),
//       const SizedBox(height: 10), // Add some spacing
//       BlocBuilder<CalendarBloc, CalendarState>(
//         builder: (context, state) {
//           if (state is CalendarStateInitial) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is CalendarStateLoaded) {
//             if (state.days.isEmpty) {
//               return const Center(child: Text('No days available'));
//             } else {
//               // Calculate the first day of the month
//               final firstDayOfMonth =
//               DateTime(state.days.first.year, state.days.first.month, 1);
//               final startingWeekday =
//                   firstDayOfMonth.weekday % 7;
//
//               // Calculate total number of items in the grid, including empty cells
//               final totalItemCount = state.days.length + startingWeekday;
//
//               return GridView.builder(
//                 padding: EdgeInsets.zero,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 7, // 7 days in a week
//                 ),
//                 shrinkWrap: true,
//                 itemCount: totalItemCount,
//                 itemBuilder: (context, index) {
//                   if (index < startingWeekday) {
//                     return const SizedBox(); // Empty cell before the first day
//                   }
//
//                   final day = state.days[index - startingWeekday];
//                   bool isSelected = day.day == DateTime.now().day &&
//                       day.month == DateTime.now().month &&
//                       day.year == DateTime.now().year;
//                   bool isTapped = day.day == (state).selectedDate?.day &&
//                       day.month == (state).selectedDate?.month &&
//                       day.year == (state).selectedDate?.year;
//
//                   return GestureDetector(
//                     onTap: () {
//                       context.read<CalendarBloc>().add(TapEvent(day));
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: isTapped
//                             ? Colors.blue.withOpacity(0.2)
//                             : isSelected
//                             ? Colors.blue
//                             : Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(
//                         child: Text(
//                           day.day.toString(),
//                           style: TextStyle(
//                               fontSize: 24,
//                               color:
//                               isSelected ? Colors.white : Colors.black),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           } else {
//             return const Center(child: Text('Unknown state'));
//           }
//         },
//       )
//     ],
//   );
// }