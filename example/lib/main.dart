import 'dart:convert';

import 'package:example/zetrix_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:zetrix_flutter/zetrix_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Blockchain Demo', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final List<_HomeOption> options = [
    _HomeOption("Account", Icons.account_circle, AccountScreen()),
    _HomeOption("Block", Icons.layers, BlockScreen()),
    _HomeOption("Transaction", Icons.swap_horiz, TransactionScreen()),
    _HomeOption("Smart Contract", Icons.code, ContractScreen()),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      backgroundColor: const Color(0xFFF9F6FF),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          shrinkWrap: true,
          itemCount: options.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final option = options[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => option.destination),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(option.icon, size: 32, color: Colors.deepPurple),
                      const SizedBox(width: 16),
                      Text(
                        option.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HomeOption {
  final String title;
  final IconData icon;
  final Widget destination;

  _HomeOption(this.title, this.icon, this.destination);
}

class HomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HomeButton(this.title, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }
}

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final ZetrixService zetrixService = ZetrixService();

  void _createAcc() async {
    try {
      final CreateAccount createAccount = await zetrixService.createZtxAcc();
      final json = createAccount.toJson();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JsonViewScreen(
            jsonString: jsonEncode({'title': 'Create Account', 'result': json}),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to create account: $e")));
    }
  }

  void _viewAccInfo() async {
    try {
      final AccountInfo accountInfo = await zetrixService.getZtxAccInfo();
      final json = accountInfo.toJson();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JsonViewScreen(
            jsonString: jsonEncode({'title': 'Account Info', 'result': json}),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to retrieve account info: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Screen'), leading: BackButton()),
      backgroundColor: const Color(0xFFF9F6FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              icon: Icons.add_circle_outline,
              label: 'Create Account',
              onPressed: _createAcc,
            ),
            SizedBox(height: 16),
            _buildActionButton(
              icon: Icons.info_outline,
              label: 'Account Info',
              onPressed: _viewAccInfo,
            ),
          ],
        ),
      ),
    );
  }
}

class _BlockScreenState extends State<BlockScreen> {
  final ZetrixService zetrixService = ZetrixService();

  void _createBlock() async {
    try {
      final BlockNumber blockNumber = await zetrixService.getZtxBlockNumber();
      final json = blockNumber.toJson();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JsonViewScreen(
            jsonString: jsonEncode({'title': 'Block Number', 'result': json}),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to get block number: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Block Screen'), leading: BackButton()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              icon: Icons.add_circle_outline,
              label: 'Get Block Number',
              onPressed: _createBlock,
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionScreenState extends State<TransactionScreen> {
  final ZetrixService zetrixService = ZetrixService();

  void _createBlob() async {
    try {
      final TransactionBuildBlobResult blobResult = await zetrixService
          .buildZtxBlob();
      final json = blobResult.toJson();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JsonViewScreen(
            jsonString: jsonEncode({
              'title': 'Transaction Blob',
              'result': json,
            }),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to get transaction blob: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction Screen'), leading: BackButton()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              icon: Icons.add_circle_outline,
              label: 'Create Transaction Blob',
              onPressed: _createBlob,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContractScreenState extends State<ContractScreen> {
  final ZetrixService zetrixService = ZetrixService();

  void _callContract() async {
    try {
      final Object? contractResult = await zetrixService.callZtxContract();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JsonViewScreen(
            jsonString: jsonEncode({
              'title': 'Contract Call',
              'result': contractResult,
            }),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to get transaction blob: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contract Screen'), leading: BackButton()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              icon: Icons.add_circle_outline,
              label: 'Create Contract Call',
              onPressed: _callContract,
            ),
          ],
        ),
      ),
    );
  }
}

class OutputScreen extends StatelessWidget {
  final String title;

  const OutputScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Output Screen'), leading: BackButton()),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('Static response for $title'),
        ),
      ),
    );
  }
}

class JsonViewScreen extends StatelessWidget {
  final String jsonString;

  const JsonViewScreen({super.key, required this.jsonString});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Output"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: "Copy JSON",
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: jsonString));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("JSON copied to clipboard!"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: JsonView.string(
            jsonString,
            theme: const JsonViewTheme(
              viewType: JsonViewType.collapsible,
              backgroundColor: Color(0xFF111111),
              keyStyle: TextStyle(color: Colors.lightBlueAccent),
              stringStyle: TextStyle(color: Colors.greenAccent),
              // numberStyle: TextStyle(color: Colors.orange),
              boolStyle: TextStyle(color: Colors.purpleAccent),
              // nullStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildActionButton({
  required IconData icon,
  required String label,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(label, style: TextStyle(fontSize: 16)),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
      ),
    ),
  );
}
