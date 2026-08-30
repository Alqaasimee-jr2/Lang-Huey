import os
from PIL import Image, ImageDraw, ImageFont

IMG_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS1_FRENCH\assets\images\jss1_term1"
os.makedirs(IMG_DIR, exist_ok=True)

# Colors
TEAL = (13, 115, 119)
TURQUOISE = (20, 189, 204)
GOLD = (244, 168, 50)
CREAM = (245, 240, 232)
CHARCOAL = (28, 28, 28)
WHITE = (255, 255, 255)
GREEN = (46, 125, 50)
INDIGO = (57, 73, 171)

def create_card(filename, title, subtitle, items, bg_color=CREAM, header_color=TEAL):
    width, height = 800, 500
    img = Image.new("RGB", (width, height), bg_color)
    draw = ImageDraw.Draw(img)

    # Header bar
    draw.rectangle([(0, 0), (width, 90)], fill=header_color)
    draw.text((30, 20), title, fill=WHITE)
    draw.text((30, 55), subtitle, fill=GOLD)

    # Content Cards
    y = 120
    for itm in items:
        draw.rounded_rectangle([(30, y), (width - 30, y + 60)], radius=12, fill=WHITE, outline=header_color, width=2)
        draw.text((50, y + 12), itm[0], fill=CHARCOAL)
        draw.text((50, y + 36), itm[1], fill=TEAL)
        y += 75

    out_path = os.path.join(IMG_DIR, filename)
    img.save(out_path)
    print(f"Generated diagram: {out_path}")

def generate_all_diagrams():
    print("Generating JSS1 Term 1 Educational Diagram Assets...")
    create_card(
        "classroom_commands_chart.png",
        "LES ORDRES DE CLASSE • CLASSROOM COMMANDS",
        "French Directives for Junior Secondary Smartboards",
        [
            ("1. Levez-vous ! / Asseyez-vous !", "Stand up! / Sit down! (Formal/Plural)"),
            ("2. Ouvrez vos livres ! / Fermez vos cahiers !", "Open your books! / Close your notebooks!"),
            ("3. Écoutez attentivement et répétez !", "Listen attentively and repeat after me!"),
            ("4. Silence, s'il vous plaît ! / Regardez le tableau !", "Silence, please! / Look at the blackboard/screen!"),
        ],
        header_color=TEAL
    )

    create_card(
        "greetings_politeness_chart.png",
        "LES SALUTATIONS & LA POLITESSE",
        "Formal (Vous) vs. Informal (Tu) Conversational Rules",
        [
            ("1. Bonjour, Monsieur / Madame !", "Formal daytime greeting for teachers and adults"),
            ("2. Salut ! Comment vas-tu ?", "Casual greeting strictly among peers and classmates"),
            ("3. Comment allez-vous ? — Très bien, merci !", "How are you? — Very well, thank you!"),
            ("4. S'il vous plaît / De rien / Je vous en prie", "Please / You're welcome / Delighted"),
        ],
        header_color=INDIGO
    )

    create_card(
        "french_accents_chart.png",
        "LES 5 ACCENTS EN FRANÇAIS",
        "Pronunciation and Spelling Reference Chart",
        [
            ("1. L'accent aigu (é)", "Sharp 'ay' sound as in: Élève, Café"),
            ("2. L'accent grave (è, à, ù)", "Open 'eh' sound as in: Mère, Frère, Où"),
            ("3. L'accent circonflexe (ê, â, î, ô, û)", "Lengthened vowel as in: Fête, Hôtel"),
            ("4. La cédille (ç) & Le tréma (ï, ë)", "Soft 's' sound in 'Français' & Vowel separation in 'Noël'"),
        ],
        header_color=TEAL
    )

    create_card(
        "nigeria_francophone_neighbors_map.png",
        "LES 4 VOISINS FRANCOPHONES DU NIGERIA",
        "Geography & Regional Trade Advantage",
        [
            ("1. Le Bénin (Ouest / West)", "Capitale : Porto-Novo • Langues et commerce direct"),
            ("2. Le Niger (Nord / North)", "Capitale : Niamey • Plus de 1 500 km de frontière"),
            ("3. Le Cameroun (Est / East)", "Capitale : Yaoundé • Pays bilingue frontalier"),
            ("4. Le Tchad (Nord-Est / North-East)", "Capitale : N'Djaména • Région du Lac Tchad"),
        ],
        header_color=GREEN
    )

    print("All JSS1 Term 1 diagrams generated successfully!")

if __name__ == "__main__":
    generate_all_diagrams()
