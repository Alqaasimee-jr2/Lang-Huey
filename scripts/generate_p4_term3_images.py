import os
from PIL import Image, ImageDraw, ImageFont

OUTPUT_DIR = r"c:\Users\DELL\Desktop\Lang Huey\mvp\assets\images\p4_term3"
os.makedirs(OUTPUT_DIR, exist_ok=True)

def get_font(size, bold=False):
    # Try system fonts
    font_names = ["segoeui.ttf", "arial.ttf", "calibri.ttf"]
    if bold:
        font_names = ["segoeuib.ttf", "arialbd.ttf", "calibrib.ttf"]
    for fn in font_names:
        try:
            return ImageFont.truetype(fn, size)
        except Exception:
            pass
    return ImageFont.load_default()

# 1. Term 3 Banner (1200 x 600)
def generate_term3_banner():
    img = Image.new("RGBA", (1200, 600), (13, 115, 119, 255)) # Teal #0D7377
    draw = ImageDraw.Draw(img)
    # Background accent curves / shapes
    draw.rounded_rectangle([40, 40, 1160, 560], radius=32, fill=(20, 189, 204, 30), outline=(244, 168, 50, 255), width=4)
    
    title_font = get_font(52, bold=True)
    sub_font = get_font(28, bold=False)
    tag_font = get_font(20, bold=True)
    
    # Tag
    draw.rounded_rectangle([80, 80, 480, 126], radius=12, fill=(244, 168, 50, 255))
    draw.text((100, 92), "PRIMARY 4 FRENCH · TERM 3", fill=(28, 28, 28, 255), font=tag_font)
    
    # Titles
    draw.text((80, 160), "TROISIÈME TRIMESTRE", fill=(255, 255, 255, 255), font=title_font)
    draw.text((80, 236), "Time, Daily Habits, Meals, Body Anatomy, Clothes & Weather", fill=(20, 189, 204, 255), font=sub_font)
    
    # 4 Curriculum Feature Pills
    pills = [
        ("1. L'Heure et la Routine", "Telling time & schedule"),
        ("2. Repas et la Faim", "3 meals, hunger & thirst"),
        ("3. Le Corps et la Santé", "Anatomy & doctor clinic"),
        ("4. Vêtements et Météo", "Wardrobe & weather"),
    ]
    for idx, (title, desc) in enumerate(pills):
        col = idx % 2
        row = idx // 2
        x = 80 + col * 530
        y = 310 + row * 110
        draw.rounded_rectangle([x, y, x + 500, y + 90], radius=16, fill=(255, 255, 255, 20), outline=(255, 255, 255, 60), width=2)
        draw.text((x + 24, y + 18), title, fill=(244, 168, 50, 255), font=get_font(22, bold=True))
        draw.text((x + 24, y + 50), desc, fill=(255, 255, 255, 220), font=get_font(18, bold=False))
        
    img.save(os.path.join(OUTPUT_DIR, "term3_banner.png"))
    print("Generated term3_banner.png")

# 2. Clock Diagram (800 x 800)
def generate_clock_diagram():
    img = Image.new("RGBA", (800, 800), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    # Outer frame
    draw.rounded_rectangle([20, 20, 780, 780], radius=28, fill=(248, 250, 252, 255), outline=(13, 115, 119, 255), width=4)
    draw.text((50, 50), "L'HEURE · TELLING TIME IN FRENCH", fill=(13, 115, 119, 255), font=get_font(32, bold=True))
    draw.text((50, 95), "Clock Face and Hourly Statements (1:00 to 12:00)", fill=(100, 116, 139, 255), font=get_font(20, bold=False))
    
    # Clock circle
    cx, cy, r = 400, 440, 260
    draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=(255, 255, 255, 255), outline=(20, 189, 204, 255), width=6)
    
    # Hour markers
    hours = [
        ("12", "Midi / Minuit", 0, -210),
        ("1", "Une heure", 105, -180),
        ("2", "Deux heures", 180, -105),
        ("3", "Et quart", 210, 0),
        ("4", "Quatre heures", 180, 105),
        ("5", "Cinq heures", 105, 180),
        ("6", "Et demie", 0, 210),
        ("7", "Sept heures", -105, 180),
        ("8", "Huit heures", -180, 105),
        ("9", "Moins le quart", -210, 0),
        ("10", "Dix heures", -180, -105),
        ("11", "Onze heures", -105, -180),
    ]
    
    for h, label, dx, dy in hours:
        px, py = cx + dx, cy + dy
        draw.ellipse([px - 26, py - 26, px + 26, py + 26], fill=(13, 115, 119, 255))
        draw.text((px - 10, py - 14), h, fill=(255, 255, 255, 255), font=get_font(20, bold=True))
    
    # Center dot
    draw.ellipse([cx - 12, cy - 12, cx + 12, cy + 12], fill=(244, 168, 50, 255))
    # Hands (pointing to 3:00)
    draw.line([cx, cy, cx + 130, cy], fill=(244, 168, 50, 255), width=8) # Minute
    draw.line([cx, cy, cx, cy - 80], fill=(13, 115, 119, 255), width=10) # Hour
    
    # Footer tag
    draw.rounded_rectangle([180, 720, 620, 760], radius=10, fill=(244, 168, 50, 255))
    draw.text((210, 728), "Quelle heure est-il ? · Il est trois heures", fill=(28, 28, 28, 255), font=get_font(18, bold=True))
    
    img.save(os.path.join(OUTPUT_DIR, "clock_diagram.png"))
    print("Generated clock_diagram.png")

# 3. Daily Routine Timeline (1000 x 600)
def generate_routine_timeline():
    img = Image.new("RGBA", (1000, 600), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    draw.rounded_rectangle([20, 20, 980, 580], radius=24, fill=(248, 250, 252, 255), outline=(20, 189, 204, 255), width=3)
    draw.text((50, 45), "LA ROUTINE QUOTIDIENNE · DAILY ROUTINE", fill=(13, 115, 119, 255), font=get_font(30, bold=True))
    draw.text((50, 88), "Chronological Schedule of Primary 4 School Day", fill=(100, 116, 139, 255), font=get_font(18, bold=False))
    
    steps = [
        ("1. 06:00", "Je me réveille", "I wake up"),
        ("2. 06:30", "Je me lave", "I wash / bathe"),
        ("3. 07:00", "Je m'habille", "I dress up"),
        ("4. 07:30", "Je prends le petit déj", "I eat breakfast"),
        ("5. 08:00", "Je vais à l'école", "I go to school"),
        ("6. 14:30", "Je rentre", "I return home"),
        ("7. 17:00", "Je fais mes devoirs", "I do homework"),
        ("8. 20:30", "Je me couche", "I go to sleep"),
    ]
    
    for idx, (time_lbl, fr, en) in enumerate(steps):
        col = idx % 4
        row = idx // 4
        x = 50 + col * 225
        y = 150 + row * 200
        
        draw.rounded_rectangle([x, y, x + 210, y + 175], radius=16, fill=(255, 255, 255, 255), outline=(226, 232, 240, 255), width=2)
        # Header tag
        draw.rounded_rectangle([x, y, x + 210, y + 42], radius=16, fill=(13, 115, 119, 255))
        draw.text((x + 16, y + 10), time_lbl, fill=(255, 255, 255, 255), font=get_font(16, bold=True))
        
        draw.text((x + 14, y + 60), fr, fill=(30, 41, 59, 255), font=get_font(16, bold=True))
        draw.text((x + 14, y + 110), en, fill=(100, 116, 139, 255), font=get_font(14, bold=False))
        
    img.save(os.path.join(OUTPUT_DIR, "daily_routine_timeline.png"))
    print("Generated daily_routine_timeline.png")

# 4. Three Meals Pyramid (900 x 600)
def generate_meals_pyramid():
    img = Image.new("RGBA", (900, 600), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    draw.rounded_rectangle([20, 20, 880, 580], radius=24, fill=(248, 250, 252, 255), outline=(217, 119, 6, 255), width=3)
    draw.text((50, 45), "LES TROIS REPAS DE LA JOURNÉE · 3 MEALS OF THE DAY", fill=(217, 119, 6, 255), font=get_font(28, bold=True))
    draw.text((50, 85), "Breakfast, Lunch and Dinner with Food & Drink Items", fill=(100, 116, 139, 255), font=get_font(18, bold=False))
    
    meals = [
        ("1. Le Petit Déjeuner", "Morning / Le matin", "Le pain, le beurre, le lait, le jus", (244, 168, 50, 255)),
        ("2. Le Déjeuner", "Afternoon / L'après-midi", "Le riz, le poulet, le poisson, la salade", (13, 115, 119, 255)),
        ("3. Le Dîner", "Evening / Le soir", "Les fruits, les légumes, l'eau", (2, 132, 199, 255)),
    ]
    
    for idx, (m_title, m_time, items, col) in enumerate(meals):
        y = 145 + idx * 135
        draw.rounded_rectangle([50, y, 850, y + 115], radius=16, fill=(255, 255, 255, 255), outline=col, width=2)
        draw.rounded_rectangle([50, y, 320, y + 115], radius=16, fill=col)
        draw.text((70, y + 25), m_title, fill=(255, 255, 255, 255), font=get_font(20, bold=True))
        draw.text((70, y + 65), m_time, fill=(255, 255, 255, 220), font=get_font(15, bold=False))
        
        draw.text((345, y + 25), "Exemples d'aliments :", fill=(100, 116, 139, 255), font=get_font(14, bold=True))
        draw.text((345, y + 55), items, fill=(30, 41, 59, 255), font=get_font(18, bold=True))
        
    img.save(os.path.join(OUTPUT_DIR, "three_meals_pyramid.png"))
    print("Generated three_meals_pyramid.png")

# 5. Body Anatomy Chart (900 x 700)
def generate_body_anatomy_chart():
    img = Image.new("RGBA", (900, 700), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    draw.rounded_rectangle([20, 20, 880, 680], radius=24, fill=(248, 250, 252, 255), outline=(225, 29, 72, 255), width=3)
    draw.text((50, 45), "LE CORPS HUMAIN · HUMAN BODY ANATOMY", fill=(225, 29, 72, 255), font=get_font(28, bold=True))
    draw.text((50, 85), "Parts of the Body and Singular/Plural Gender Classification", fill=(100, 116, 139, 255), font=get_font(18, bold=False))
    
    parts = [
        ("La tête", "The head", "Féminin singulier"),
        ("Le visage", "The face", "Masculin singulier"),
        ("Les yeux", "The eyes", "Pluriel (œil)"),
        ("Le nez", "The nose", "Masculin singulier"),
        ("La bouche", "The mouth", "Féminin singulier"),
        ("Les oreilles", "The ears", "Féminin pluriel"),
        ("Le bras", "The arm", "Masculin singulier"),
        ("La main", "The hand", "Féminin singulier"),
        ("Le ventre", "The belly", "Masculin singulier"),
        ("La jambe", "The leg", "Féminin singulier"),
        ("Le pied", "The foot", "Masculin singulier"),
        ("Les dents", "The teeth", "Féminin pluriel"),
    ]
    
    for idx, (fr, en, gram) in enumerate(parts):
        col = idx % 3
        row = idx // 3
        x = 50 + col * 270
        y = 145 + row * 125
        
        draw.rounded_rectangle([x, y, x + 250, y + 105], radius=14, fill=(255, 255, 255, 255), outline=(226, 232, 240, 255), width=2)
        draw.text((x + 16, y + 14), fr, fill=(225, 29, 72, 255), font=get_font(20, bold=True))
        draw.text((x + 16, y + 46), en, fill=(30, 41, 59, 255), font=get_font(15, bold=False))
        draw.text((x + 16, y + 74), gram, fill=(100, 116, 139, 255), font=get_font(12, bold=True))
        
    img.save(os.path.join(OUTPUT_DIR, "body_anatomy_chart.png"))
    print("Generated body_anatomy_chart.png")

# 6. Health & Hygiene Card (900 x 600)
def generate_health_hygiene_card():
    img = Image.new("RGBA", (900, 600), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    draw.rounded_rectangle([20, 20, 880, 580], radius=24, fill=(248, 250, 252, 255), outline=(13, 115, 119, 255), width=3)
    draw.text((50, 45), "SANTÉ ET HYGIÈNE · HEALTH & HYGIENE", fill=(13, 115, 119, 255), font=get_font(28, bold=True))
    draw.text((50, 85), "Expressing Pain (J'ai mal à...) & Daily Cleanliness Habits", fill=(100, 116, 139, 255), font=get_font(18, bold=False))
    
    # Left Box: Doctor clinic & pain
    draw.rounded_rectangle([50, 140, 430, 540], radius=16, fill=(255, 255, 255, 255), outline=(225, 29, 72, 255), width=2)
    draw.rounded_rectangle([50, 140, 430, 190], radius=16, fill=(225, 29, 72, 255))
    draw.text((70, 152), "Où as-tu mal ? (Clinic)", fill=(255, 255, 255, 255), font=get_font(18, bold=True))
    
    pain_items = [
        ("J'ai mal à la tête", "Headache"),
        ("J'ai mal au ventre", "Stomach ache"),
        ("J'ai mal à la gorge", "Sore throat"),
        ("J'ai mal aux dents", "Toothache"),
        ("J'ai de la fièvre", "I have fever"),
    ]
    for idx, (fr, en) in enumerate(pain_items):
        py = 210 + idx * 60
        draw.text((70, py), fr, fill=(30, 41, 59, 255), font=get_font(16, bold=True))
        draw.text((70, py + 26), en, fill=(100, 116, 139, 255), font=get_font(13, bold=False))
        
    # Right Box: Hygiene habits
    draw.rounded_rectangle([460, 140, 850, 540], radius=16, fill=(255, 255, 255, 255), outline=(13, 115, 119, 255), width=2)
    draw.rounded_rectangle([460, 140, 850, 190], radius=16, fill=(13, 115, 119, 255))
    draw.text((480, 152), "Les Bonnes Habitudes d'Hygiène", fill=(255, 255, 255, 255), font=get_font(18, bold=True))
    
    hygiene_items = [
        ("Je me lave les mains", "I wash my hands with soap"),
        ("Je me brosse les dents", "I brush my teeth twice daily"),
        ("Je prends une douche", "I take a daily bath/shower"),
        ("Je nettoie ma chambre", "I keep my room clean"),
        ("Je mange proprement", "I eat clean, healthy food"),
    ]
    for idx, (fr, en) in enumerate(hygiene_items):
        py = 210 + idx * 60
        draw.text((480, py), fr, fill=(30, 41, 59, 255), font=get_font(16, bold=True))
        draw.text((480, py + 26), en, fill=(100, 116, 139, 255), font=get_font(13, bold=False))
        
    img.save(os.path.join(OUTPUT_DIR, "health_hygiene_card.png"))
    print("Generated health_hygiene_card.png")

# 7. Weather and Seasons Map (900 x 600)
def generate_weather_seasons_map():
    img = Image.new("RGBA", (900, 600), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    draw.rounded_rectangle([20, 20, 880, 580], radius=24, fill=(248, 250, 252, 255), outline=(2, 132, 199, 255), width=3)
    draw.text((50, 45), "LE TEMPS ET LES SAISONS · WEATHER & CLIMATE", fill=(2, 132, 199, 255), font=get_font(28, bold=True))
    draw.text((50, 85), "Comparing Nigerian Harmattan & Rain with French Climate", fill=(100, 116, 139, 255), font=get_font(18, bold=False))
    
    weathers = [
        ("Il fait beau", "Fine / Sunny", "Le soleil brille"),
        ("Il fait chaud", "It is hot", "La saison sèche"),
        ("Il fait froid", "It is cold", "L'harmattan / L'hiver"),
        ("Il pleut", "It is raining", "La saison des pluies"),
        ("Il fait du vent", "It is windy", "L'harmattan venteux"),
        ("Le ciel est bleu", "Clear blue sky", "Temps clair et dégagé"),
    ]
    
    for idx, (fr, en, desc) in enumerate(weathers):
        col = idx % 3
        row = idx // 3
        x = 50 + col * 270
        y = 150 + row * 190
        
        draw.rounded_rectangle([x, y, x + 250, y + 160], radius=16, fill=(255, 255, 255, 255), outline=(226, 232, 240, 255), width=2)
        draw.rounded_rectangle([x, y, x + 250, y + 45], radius=16, fill=(2, 132, 199, 255))
        draw.text((x + 16, y + 12), fr, fill=(255, 255, 255, 255), font=get_font(18, bold=True))
        
        draw.text((x + 16, y + 65), en, fill=(30, 41, 59, 255), font=get_font(16, bold=True))
        draw.text((x + 16, y + 105), desc, fill=(100, 116, 139, 255), font=get_font(14, bold=False))
        
    img.save(os.path.join(OUTPUT_DIR, "weather_seasons_map.png"))
    print("Generated weather_seasons_map.png")

# 8. Graduation Certificate Template (1200 x 800)
def generate_graduation_certificate():
    img = Image.new("RGBA", (1200, 800), (255, 255, 255, 255))
    draw = ImageDraw.Draw(img)
    
    # Ornate Border
    draw.rounded_rectangle([30, 30, 1170, 770], radius=32, fill=(254, 252, 232, 255), outline=(13, 115, 119, 255), width=8)
    draw.rounded_rectangle([50, 50, 1150, 750], radius=24, fill=(255, 255, 255, 255), outline=(244, 168, 50, 255), width=4)
    
    # Crest & Titles
    draw.text((250, 90), "DIPLÔME DE MAÎTRISE EN FRANÇAIS", fill=(13, 115, 119, 255), font=get_font(38, bold=True))
    draw.text((340, 150), "PRIMARY 4 FRENCH LANGUAGE CERTIFICATE OF EXCELLENCE", fill=(100, 116, 139, 255), font=get_font(18, bold=True))
    
    # Body text
    body = (
        "Décerné avec les félicitations du jury scolaire à tous les élèves de 4e Année\n"
        "pour avoir complété avec succès les 39 semaines du programme de français :\n\n"
        "• Trimestre 1 : Salutations, Nombres 1–20, Identité et Géographie Francophone\n"
        "• Trimestre 2 : La Famille, L'École, Les Objets de Classe, Les Prépositions et Les Couleurs\n"
        "• Trimestre 3 : L'Heure, La Routine, Les Repas, Le Corps Humain, Les Habits et La Météo\n\n"
        "Félicitations pour cette remarquable réussite et Bienvenue en 5e Année (Primary 5) !"
    )
    draw.text((120, 230), body, fill=(30, 41, 59, 255), font=get_font(20, bold=False), spacing=10)
    
    # Signatures
    draw.line([150, 680, 450, 680], fill=(100, 116, 139, 255), width=2)
    draw.text((180, 690), "Le Professeur de Français", fill=(100, 116, 139, 255), font=get_font(16, bold=True))
    
    draw.line([750, 680, 1050, 680], fill=(100, 116, 139, 255), width=2)
    draw.text((780, 690), "La Direction de l'École", fill=(100, 116, 139, 255), font=get_font(16, bold=True))
    
    # Gold Seal
    draw.ellipse([540, 600, 660, 720], fill=(244, 168, 50, 255), outline=(217, 119, 6, 255), width=4)
    draw.text((565, 645), "EXCELLENCE", fill=(28, 28, 28, 255), font=get_font(12, bold=True))
    
    img.save(os.path.join(OUTPUT_DIR, "graduation_certificate_template.png"))
    print("Generated graduation_certificate_template.png")

if __name__ == "__main__":
    generate_term3_banner()
    generate_clock_diagram()
    generate_routine_timeline()
    generate_meals_pyramid()
    generate_body_anatomy_chart()
    generate_health_hygiene_card()
    generate_weather_seasons_map()
    generate_graduation_certificate()
    print("\n[SUCCESS] All Term 3 visual assets generated successfully!")
