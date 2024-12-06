import 'package:flutter/material.dart';

class FormAnime extends StatefulWidget {
  const FormAnime({Key? key}) : super(key: key);

  @override
  _FormAnimeState createState() => _FormAnimeState();
}

class _FormAnimeState extends State<FormAnime> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  String? releaseDate;
  String? selectedGenre;
  String? preferredPlatform;
  bool isWatched = false;
  bool isRecommendation = false;
  Map<String, bool> selectedCharacters = {
    "Rin Shima": false,
    "Nadeshiko Kagamihara": false,
    "Chiaki Ōgaki": false,
    "Aoi Inuyama": false,
    "Ena Saitō": false,
    "Ayano Toki": false,
    "Ema Mizunami": false,
    "Mei Nakatsugawa": false,
  };

  final List<String> genreList = [
    "Action",
    "Adventure",
    "Comedy",
    "Drama",
    "Fantasy",
    "Horror",
    "Romance",
    "Sci-Fi",
    "Slice of Life"
  ];

  final List<String> platformList = ["Bstation", "Muse Indonesia", "Wibuku"];

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        releaseDate =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  void _showResult() {
    if (_formKey.currentState!.validate()) {
      final selectedCharactersList = selectedCharacters.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Hasil Form Anime',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.deepPurple,
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildResultText("Judul Anime", titleController.text),
                  _buildResultText("Tanggal Rilis", releaseDate),
                  _buildResultText("Genre", selectedGenre),
                  _buildResultText("Platform", preferredPlatform),
                  _buildResultText(
                      "Sudah Ditonton", isWatched ? "Ya" : "Belum"),
                  _buildResultText("Rekomendasi untuk Orang Lain",
                      isRecommendation ? "Ya" : "Tidak"),
                  _buildResultText(
                      "Karakter Favorit",
                      selectedCharactersList.isNotEmpty
                          ? selectedCharactersList.join(', ')
                          : "Belum dipilih"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Tutup",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildResultText(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "$label: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            TextSpan(text: value ?? 'Belum diisi'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        title: Text('Form Anime Favorit',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                controller: titleController,
                label: "Judul Anime",
                hint: "Masukkan judul anime favorit Anda",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon masukkan judul anime';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildDatePicker(context),
              const SizedBox(height: 16),
              _buildDropdownField(),
              const SizedBox(height: 16),
              _buildSwitch("Sudah Ditonton?", isWatched,
                  (val) => setState(() => isWatched = val)),
              _buildSwitch("Rekomendasi untuk Orang Lain?", isRecommendation,
                  (val) => setState(() => isRecommendation = val)),
              const SizedBox(height: 16),
              _buildPlatformSelection(),
              const SizedBox(height: 16),
              _buildCharacterSelection(),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _showResult,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Lihat Hasil',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        errorStyle: TextStyle(color: Colors.yellow),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: "Tanggal Rilis",
            labelStyle: TextStyle(color: Colors.white),
            hintText: "Pilih tanggal rilis",
            hintStyle: TextStyle(color: Colors.white70),
            suffixIcon: Icon(Icons.date_range, color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          controller: TextEditingController(text: releaseDate ?? ''),
          validator: (value) {
            if (releaseDate == null) {
              return 'Mohon pilih tanggal rilis';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Genre Anime",
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white70),
        ),
      ),
      dropdownColor: Colors.deepPurple.shade700,
      style: TextStyle(color: Colors.white),
      value: selectedGenre,
      hint: Text("Pilih Genre", style: TextStyle(color: Colors.white70)),
      items: genreList
          .map((genre) => DropdownMenuItem(
              value: genre,
              child: Text(genre, style: TextStyle(color: Colors.white))))
          .toList(),
      onChanged: (value) => setState(() => selectedGenre = value),
      validator: (value) {
        if (value == null) {
          return 'Mohon pilih genre';
        }
        return null;
      },
    );
  }

  Widget _buildSwitch(String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          inactiveThumbColor: Colors.white70,
        ),
      ],
    );
  }

  Widget _buildPlatformSelection() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Platform Favorit:",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Row(
              children: platformList.map((platform) {
                return Expanded(
                  child: RadioListTile<String>(
                    title:
                        Text(platform, style: TextStyle(color: Colors.white)),
                    value: platform,
                    groupValue: preferredPlatform,
                    onChanged: (val) => setState(() => preferredPlatform = val),
                    activeColor: Colors.white,
                  ),
                );
              }).toList(),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.yellow, fontSize: 12),
                ),
              ),
          ],
        );
      },
      validator: (_) {
        if (preferredPlatform == null) {
          return 'Mohon pilih platform';
        }
        return null;
      },
    );
  }

  Widget _buildCharacterSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Karakter Favorit:",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        ...selectedCharacters.keys.map(
          (character) => CheckboxListTile(
            title: Text(character, style: TextStyle(color: Colors.white)),
            value: selectedCharacters[character],
            onChanged: (val) =>
                setState(() => selectedCharacters[character] = val ?? false),
            activeColor: Colors.white,
            checkColor: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
