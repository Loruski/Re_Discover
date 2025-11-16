
import 'package:flutter/material.dart';
import 'package:re_discover/ui/MAP/screens/quiz_completed_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  //TODO: implementare parametri necessari per il quiz (probabilmente si passa solo l'id)

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Dati demo del quiz (possono arrivare da repo/API in futuro)
  final String _title = "Unlock Colosseo";
  final String _description =
      "<stessa descrizione della card del quiz>\n<stessa descrizione della card del quiz>";
  final String _question = "Questa è una possibile domanda?";
  final List<String> _answers = const [
    "Possibile risposta 1",
    "Possibile risposta 2",
    "Possibile risposta 3",
  ];

  final int _correctIndex = 1; // indice della risposta corretta

  int _attemptsLeft = 3;

  int? _selectedIndex;

  void _onConfirm() {
    if (_selectedIndex == null || _attemptsLeft == 0) return;

    final isCorrect = _selectedIndex == _correctIndex;
    if (isCorrect) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const QuizCompletedScreen(),
        ),
      );
      return;
    }

    setState(() {
      _attemptsLeft = (_attemptsLeft - 1).clamp(0, 3);
      _selectedIndex = null;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.track_changes, size: 20, color: Colors.orange),
              Text(
                "1500XP",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
              SizedBox(width: 15),
              Icon(Icons.diamond, size: 20, color: Colors.pink),
              Text(
                "5",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {  },
            child: Row(
              children: const [
                Text("Help"),
              ],
            ),
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20,0,20,20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                _title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ), // titolo quiz
              const SizedBox(height: 20),
              Text(
                _description,
                style: const TextStyle(fontSize: 16),
              ), // titolo e descrizione quiz
              const SizedBox(height: 12),
              // Sostituito il Container con height fisso con un widget responsive
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ), // immagine quiz responsive
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Domanda di sblocco", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Tentativi: ", style: TextStyle(fontSize: 16)),
                      // indicatori tentativi dinamici
                      ...List.generate(3, (i) {
                        final color = i < _attemptsLeft ? Colors.green : Colors.red;
                        return Row(
                          children: [
                            Icon(Icons.circle, color: color, size: 16),
                            if (i < 2) const SizedBox(width: 4),
                          ],
                        );
                      })
                    ],
                  ),
                ],
              ), // titolo sezione domanda e tentativi
              const SizedBox(height: 5),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        // padding più responsivo rispetto a valori fissi grandi
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(_question),
                            const SizedBox(height: 20),
                            // Elenco risposte selezionabili
                            ...List.generate(_answers.length, (i) {
                              final selected = _selectedIndex == i;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: OutlinedButton(
                                  onPressed: _attemptsLeft == 0
                                      ? null
                                      : () {
                                          setState(() => _selectedIndex = i);
                                        },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                                    side: BorderSide(
                                      color: selected
                                          ? Theme.of(context).colorScheme.primary
                                          : Colors.grey.shade400,
                                    ),
                                    backgroundColor: selected
                                        ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.12)
                                        : null,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(_answers[i]),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ), // box domanda e risposte
              const Spacer(),
              // Bottone conferma a larghezza piena
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (_selectedIndex == null || _attemptsLeft == 0) ? null : _onConfirm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: (_selectedIndex == null || _attemptsLeft == 0)
                            ? null
                            : Colors.green,
                      ),
                      child: const Text(
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          "Conferma Risposta"
                      ),
                    ),
                  ),
                ],
              ), // bottone conferma risposta
            ],
          ),
        ),
      ),
    );
  }
}
