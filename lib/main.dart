import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ogie M. Entrecoso - Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Arial',
        colorSchemeSeed: Colors.blue,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollTo(double position) {
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  Widget _profilePicture(double diameter) {
    return Container(
      width: diameter,
      height: diameter,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'assets/Me.png',
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return Scaffold(
      appBar: AppBar(
        
        actions: isMobile
            ? null
            : [
                TextButton(
                  onPressed: () => scrollTo(0),
                  child: const Text('Home'),
                ),
                TextButton(
                  onPressed: () => scrollTo(650),
                  child: const Text('About'),
                ),
                TextButton(
                  onPressed: () => scrollTo(1150),
                  child: const Text('Experience'),
                ),
                TextButton(
                  onPressed: () => scrollTo(1900),
                  child: const Text('Skills'),
                ),
                TextButton(
                  onPressed: () => scrollTo(2500),
                  child: const Text('Contact'),
                ),
              ],
      ),

      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profilePicture(60),
                        const SizedBox(height: 10),
                        const Text(
                          'Ogie M. Entrecoso',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(0);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(650);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.work),
                    title: const Text('Experience'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(1150);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('Skills'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(1900);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Contact'),
                    onTap: () {
                      Navigator.pop(context);
                      scrollTo(2500);
                    },
                  ),
                ],
              ),
            )
          : null,

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHero(isMobile),
            _buildAbout(isMobile),
            _buildExperience(isMobile),
            _buildSkills(isMobile),
            _buildEducation(isMobile),
            _buildCertificate(isMobile),
            _buildContact(isMobile),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool isMobile) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 650),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 25 : 80,
        vertical: 80,
      ),
      child: Center(
        child: Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: isMobile ? 0 : 2,
              fit: isMobile ? FlexFit.loose : FlexFit.tight,
              child: Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HELLO, I\'M',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 4,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    'Ogie M.\nEntrecoso',
                    textAlign: isMobile
                        ? TextAlign.center
                        : TextAlign.left,
                    style: TextStyle(
                      fontSize: isMobile ? 45 : 65,
                      fontWeight: FontWeight.bold,
                      height: 1.05,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'IT Professional • Software Developer • Network Administrator',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: isMobile
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => scrollTo(2500),
                        icon: const Icon(Icons.email),
                        label: const Text('Contact Me'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => scrollTo(1150),
                        icon: const Icon(Icons.work),
                        label: const Text('View Experience'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Davao City, Philippines',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            if (!isMobile) const SizedBox(width: 80),

            if (isMobile)
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: _profilePicture(200),
              )
            else
              Expanded(
                child: Center(
                  child: _profilePicture(300),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbout(bool isMobile) {
    return _section(
      title: 'About Me',
      child: const Text(
        'I am an IT professional and software developer with experience in '
        'technical support, network administration, Windows Server management, '
        'CCTV, IP telephony, Google Workspace, and custom software development. '
        'I enjoy developing practical software solutions that help businesses '
        'improve their daily operations.',
        style: TextStyle(
          fontSize: 17,
          height: 1.8,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildExperience(bool isMobile) {
    return _section(
      title: 'Work Experience',
      child: Column(
        children: [
          _experienceCard(
            title: 'IT Team Leader',
            company: 'BF Industries',
            location: 'Davao City',
            dates: 'March 2020 – Present',
            responsibilities: [
              'Provide end-to-end technical support for employees.',
              'Manage company VLAN network and Layer 3 switches.',
              'Manage and maintain Windows Servers.',
              'Manage and troubleshoot CCTV systems.',
              'Manage and troubleshoot IP PABX telephone systems.',
              'Manage company Google Workspace.',
              'Manage ISO documentation and ensure compliance with established company policies and procedures.',
              'Troubleshoot and repair computers, laptops, routers, switches, IP telephones and printers.',
              'Develop systems to meet company requirements.',
            ],
          ),

          const SizedBox(height: 30),

          _experienceCard(
            title: 'Company IT',
            company: 'BKD',
            location: 'Davao City',
            dates: 'March 2018 – November 2020',
            responsibilities: [
              'Technical support for employees.',
              'Setup and configuration of Windows Servers.',
              'Installation and configuration of CCTV systems.',
              'Installation of Fire Detection and Alarm Systems.',
              'Management of Wi-Fi routers and P2P antennas.',
              'Troubleshooting and repair of computers and laptops.',
            ],
          ),
        ],
      ),
    );
  }

  Widget _experienceCard({
    required String title,
    required String company,
    required String location,
    required String dates,
    required List<String> responsibilities,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '$company • $location',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              dates,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            ...responsibilities.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(item)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkills(bool isMobile) {
    final skills = [
      ('Software Development', Icons.code),
      ('Google Workspace', Icons.cloud),
      ('VB.NET', Icons.computer),
      ('Microsoft SQL Server', Icons.storage),
      ('Network Configuration', Icons.router),
      ('Web Design', Icons.web),
      ('Windows Servers', Icons.dns),
      ('Network Administration', Icons.lan),
      ('MySQL', Icons.storage),
    ];

    return _section(
      title: 'Skills',
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: skills.map((skill) {
          return SizedBox(
            width: isMobile ? double.infinity : 250,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      skill.$2,
                      color: Colors.blue,
                      size: 30,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        skill.$1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEducation(bool isMobile) {
    return _section(
      title: 'Education',
      child: Card(
        child: ListTile(
          leading: const Icon(
            Icons.school,
            color: Colors.blue,
            size: 40,
          ),
          title: const Text(
            'Bachelor of Science in Computer Science',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'Tagum City College of Science and Technology Inc • Tagum',
          ),
        ),
      ),
    );
  }

  Widget _buildCertificate(bool isMobile) {
    return _section(
      title: 'Certificates & Licenses',
      child: Card(
        child: ListTile(
          leading: const Icon(
            Icons.verified,
            color: Colors.blue,
            size: 40,
          ),
          title: const Text(
            'Avoiding Data & Privacy Breaches',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'Issued February 2022 • Does not expire',
          ),
        ),
      ),
    );
  }

  Widget _buildContact(bool isMobile) {
    return _section(
      title: 'Contact Me',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Icon(
                Icons.contact_mail,
                size: 60,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Let\'s Work Together',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Email: gieentrecoso01@gmail.com',
                style: TextStyle(fontSize: 17),
              ),

              const SizedBox(height: 10),

              const Text(
                'Phone: 0962 143 8998',
                style: TextStyle(fontSize: 17),
              ),

              const SizedBox(height: 10),

              const Text(
                'Location: Davao City, Philippines',
                style: TextStyle(fontSize: 17),
              ),

              const SizedBox(height: 25),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.email),
                label: const Text('Send Me an Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: 60,
                height: 4,
                color: Colors.blue,
              ),

              const SizedBox(height: 35),

              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: const Column(
        children: [
          Text(
            'Ogie M. Entrecoso',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'IT Professional • Software Developer',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            '© 2026 Ogie M. Entrecoso',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}