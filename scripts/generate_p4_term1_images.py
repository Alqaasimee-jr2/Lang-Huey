import os
from PIL import Image, ImageDraw, ImageFont

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "mvp", "assets", "images", "p4_term1")
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Brand Colors
TEAL = (13, 115, 119)        # #0D7377
TURQUOISE = (20, 189, 204)   # #14BDCC
CREAM = (245, 240, 232)      # #F5F0E8
CHARCOAL = (28, 28, 28)      # #1C1C1C
GOLD = (244, 168, 50)        # #F4A832
WHITE = (255, 255, 255)
GREEN = (46, 125, 50)
RED = (211, 47, 47)
YELLOW = (253, 216, 53)
BLUE = (25, 118, 210)
ORANGE = (230, 81, 0)

def create_flag(filename, colors, orientation="vertical"):
    """Creates a 3-stripe flag image"""
    img = Image.new("RGBA", (300, 200), (255, 255, 255, 0))
    draw = ImageDraw.Draw(img)
    
    # Rounded rect background
    draw.rounded_rectangle([0, 0, 300, 200], radius=16, fill=WHITE, outline=CHARCOAL, width=3)
    
    if orientation == "vertical":
        w = 300 // 3
        draw.rounded_rectangle([0, 0, w, 200], radius=16, fill=colors[0])
        draw.rectangle([w-10, 0, w, 200], fill=colors[0])
        draw.rectangle([w, 0, 2*w, 200], fill=colors[1])
        draw.rounded_rectangle([2*w, 0, 300, 200], radius=16, fill=colors[2])
        draw.rectangle([2*w, 0, 2*w+10, 200], fill=colors[2])
    elif orientation == "horizontal":
        h = 200 // 3
        draw.rounded_rectangle([0, 0, 300, h], radius=16, fill=colors[0])
        draw.rectangle([0, h-10, 300, h], fill=colors[0])
        draw.rectangle([0, h, 300, 2*h], fill=colors[1])
        draw.rounded_rectangle([0, 2*h, 300, 200], radius=16, fill=colors[2])
        draw.rectangle([0, 2*h, 300, 2*h+10], fill=colors[2])
    elif orientation == "benin":
        # Benin flag: green on left, yellow top right, red bottom right
        draw.rounded_rectangle([0, 0, 120, 200], radius=16, fill=GREEN)
        draw.rectangle([110, 0, 120, 200], fill=GREEN)
        draw.rounded_rectangle([120, 0, 300, 100], radius=16, fill=YELLOW)
        draw.rectangle([120, 90, 300, 100], fill=YELLOW)
        draw.rounded_rectangle([120, 100, 300, 200], radius=16, fill=RED)
        draw.rectangle([120, 100, 300, 110], fill=RED)
    elif orientation == "cameroon":
        # Cameroon: Green, Red with yellow star, Yellow
        w = 300 // 3
        draw.rounded_rectangle([0, 0, w, 200], radius=16, fill=GREEN)
        draw.rectangle([w-10, 0, w, 200], fill=GREEN)
        draw.rectangle([w, 0, 2*w, 200], fill=RED)
        draw.rounded_rectangle([2*w, 0, 300, 200], radius=16, fill=YELLOW)
        draw.rectangle([2*w, 0, 2*w+10, 200], fill=YELLOW)
        # Small star in center
        cx, cy = 150, 100
        draw.ellipse([cx-15, cy-15, cx+15, cy+15], fill=YELLOW)
        
    draw.rounded_rectangle([0, 0, 300, 200], radius=16, outline=TEAL, width=4)
    img.save(os.path.join(OUTPUT_DIR, filename))
    print(f"Created {filename}")

def create_badge(filename, title, subtitle, bg_color, fg_color, symbol_type="badge"):
    """Creates a modern UI badge/card for educational topics"""
    img = Image.new("RGBA", (400, 300), (255, 255, 255, 0))
    draw = ImageDraw.Draw(img)
    
    # Outer card
    draw.rounded_rectangle([0, 0, 400, 300], radius=24, fill=bg_color, outline=TEAL, width=4)
    
    # Inner decorative circle
    cx, cy = 200, 110
    draw.ellipse([cx-55, cy-55, cx+55, cy+55], fill=WHITE, outline=TURQUOISE, width=3)
    
    # Symbol
    if symbol_type == "sun":
        draw.ellipse([cx-25, cy-25, cx+25, cy+25], fill=GOLD)
    elif symbol_type == "moon":
        draw.ellipse([cx-25, cy-25, cx+25, cy+25], fill=TURQUOISE)
        draw.ellipse([cx-12, cy-25, cx+25, cy+25], fill=WHITE)
    elif symbol_type == "bed":
        draw.rectangle([cx-30, cy-10, cx+30, cy+20], fill=TEAL)
        draw.ellipse([cx-25, cy-20, cx-5, cy-5], fill=GOLD)
    elif symbol_type == "heart":
        draw.ellipse([cx-25, cy-20, cx, cy+10], fill=RED)
        draw.ellipse([cx, cy-20, cx+25, cy+10], fill=RED)
    elif symbol_type == "boy":
        draw.ellipse([cx-20, cy-35, cx+20, cy+5], fill=TEAL)
        draw.rectangle([cx-25, cy+10, cx+25, cy+40], fill=BLUE)
    elif symbol_type == "girl":
        draw.ellipse([cx-20, cy-35, cx+20, cy+5], fill=GOLD)
        draw.polygon([(cx, cy+5), (cx-30, cy+40), (cx+30, cy+40)], fill=RED)

    # Texts
    # Draw simple text using default bitmap font or outline boxes
    draw.rounded_rectangle([40, 190, 360, 240], radius=12, fill=WHITE, outline=TURQUOISE, width=2)
    draw.rounded_rectangle([60, 250, 340, 280], radius=8, fill=TEAL)
    
    img.save(os.path.join(OUTPUT_DIR, filename))
    print(f"Created {filename}")

def create_id_card_template():
    """Creates a blank Carte d'Identité Scolaire background"""
    img = Image.new("RGBA", (500, 320), (255, 255, 255, 0))
    draw = ImageDraw.Draw(img)
    
    # Outer ID card frame
    draw.rounded_rectangle([0, 0, 500, 320], radius=24, fill=CREAM, outline=TEAL, width=5)
    
    # Header ribbon
    draw.rounded_rectangle([0, 0, 500, 70], radius=20, fill=TEAL)
    draw.rectangle([0, 50, 500, 70], fill=TEAL)
    
    # Photo box
    draw.rounded_rectangle([30, 90, 150, 240], radius=14, fill=WHITE, outline=TURQUOISE, width=3)
    
    # Line placeholders
    lines_y = [110, 150, 190, 230, 270]
    for y in lines_y:
        draw.line([180, y, 460, y], fill=TEAL, width=3)
        
    img.save(os.path.join(OUTPUT_DIR, "carte_scolaire_bg.png"))
    print("Created carte_scolaire_bg.png")

if __name__ == "__main__":
    # 1. Border Flags
    create_flag("flag_benin.png", [], orientation="benin")
    create_flag("flag_niger.png", [ORANGE, WHITE, GREEN], orientation="horizontal")
    create_flag("flag_tchad.png", [BLUE, YELLOW, RED], orientation="vertical")
    create_flag("flag_cameroun.png", [], orientation="cameroon")
    create_flag("flag_nigeria.png", [GREEN, WHITE, GREEN], orientation="vertical")
    
    # 2. Greeting Times & Customs
    create_badge("matin_sun.png", "Matin", "Bonjour", CREAM, TEAL, symbol_type="sun")
    create_badge("soir_moon.png", "Soir", "Bonsoir", CHARCOAL, WHITE, symbol_type="moon")
    create_badge("coucher_bed.png", "Coucher", "Bonne nuit", TEAL, WHITE, symbol_type="bed")
    create_badge("la_bise_culture.png", "Culture", "La Bise", CREAM, RED, symbol_type="heart")
    create_badge("garcon_avatar.png", "Garcon", "Je suis un garcon", CREAM, TEAL, symbol_type="boy")
    create_badge("fille_avatar.png", "Fille", "Je suis une fille", CREAM, GOLD, symbol_type="girl")

    # 3. ID Card Template
    create_id_card_template()
    print("All image assets created successfully!")
