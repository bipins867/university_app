import 'package:flutter/material.dart';
import 'package:university_app/Components/Home/Body/Welcome/video_player_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  final String title = 'WELCOME TO M.M.M.U.T.';
  final String subTitle = 'Madan Mohan Malaviya University of Technology';
  final String description =
      'Madan Mohan Malaviya University of Technology, Gorakhpur has been established in year 2013 by the Government of Uttar Pradesh in the form of a non-affiliating, teaching and research University after reconstituting the Madan Mohan Malaviya Engineering College, Gorakhpur which was established in 1962. Fifty-Five batches of students have entered its portals to emerge after four years of rigorous education under the tutelage of some of the most venerable teachers, engineers ready to face the world and create new worlds.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Set the border color
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
              height: 20.0,
              indent: 2.0,
              endIndent: 2.0,
            ),
            const VideoPlayerMMUT(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
