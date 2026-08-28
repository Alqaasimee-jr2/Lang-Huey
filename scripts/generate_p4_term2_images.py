import os
from PIL import Image, ImageDraw, ImageFont

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "mvp", "assets", "images", "p4_term2")
os.makedirs(OUTPUT_DIR, exist_ok=True)

def draw_card(width, height, bg_color, title, subtitle, accent_color, out_filename):
    img = Image.new("RGBA", (width, height), bg_color)
    draw = ImageDraw.Draw(img)
    
    # Border
    draw.rounded_rectangle([(8, 8), (width - 8, height - 8)], radius=24, outline=accent_color, width=4)
    
    # Accent Header Bar
    draw.rounded_rectangle([(16, 16), (width - 16, 70)], radius=16, fill=accent_color)
    
    # Simple crisp labels
    draw.text((width // 2, 42), title, fill=(255, 255, 255), anchor="mm")
    draw.text((width // 2, height // 2 + 10), subtitle, fill=(30, 41, 59), anchor="mm")
    
    out_path = os.path.join(OUTPUT_DIR, out_filename)
    img.save(out_path)
    print(f"[IMAGE] Created {out_filename} ({width}x{height})")

def generate_all_images():
    print("Generating Term 2 Visual Illustrations...")
    draw_card(400, 300, (254, 250, 240, 255), "LA FAMILLE", "Papa, Maman, Frère, Sœur", (13, 115, 119), "family_portrait.png")
    draw_card(400, 300, (254, 250, 240, 255), "L'ARBRE GÉNÉALOGIQUE", "3 Générations de Famille", (244, 168, 50), "family_tree.png")
    draw_card(400, 300, (254, 250, 240, 255), "LA CLASSE", "Tableau, Bureau, Livres", (13, 115, 119), "classroom_map.png")
    draw_card(400, 300, (254, 250, 240, 255), "L'ÉCOLE", "Campus, Bibliothèque, Cour", (244, 168, 50), "campus_map.png")
    draw_card(400, 300, (254, 250, 240, 255), "EMPLOI DU TEMPS", "Lundi à Dimanche", (13, 115, 119), "timetable_calendar.png")
    draw_card(400, 300, (254, 250, 240, 255), "LES PRÉPOSITIONS", "Sur, Sous, Dans, Devant", (20, 184, 166), "preposition_stage.png")
    draw_card(400, 300, (254, 250, 240, 255), "LES COULEURS", "Rouge, Bleu, Jaune, Vert, Noir, Blanc", (244, 168, 50), "color_wheel.png")
    draw_card(400, 300, (254, 250, 240, 255), "BONNES VACANCES !", "Fin du Deuxième Trimestre", (13, 115, 119), "vacation_celebration.png")

if __name__ == "__main__":
    generate_all_images()
