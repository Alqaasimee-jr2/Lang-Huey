#!/usr/bin/env python3
"""
Synthesizes all 85 authentic French neural audio clips for JSS 2 Term 2
using Microsoft Edge TTS (fr-FR-DeniseNeural at -4% classroom speed).
"""

import asyncio
import os
import edge_tts

OUTPUT_DIR = r"c:\Users\DELL\Desktop\Lang Huey\JSS 2_FRENCH\assets\audio\jss2_term2"
VOICE = "fr-FR-DeniseNeural"
RATE = "-4%"

CLIPS = {
    # Week 1: Établir des listes/inventaires
    "la_liste_des_courses": "la liste des courses",
    "linventaire_du_materiel": "l'inventaire du matériel",
    "les_fournitures_scolaires": "les fournitures scolaires",
    "il_manque_deux_cahiers": "Il manque deux cahiers.",
    "il_nous_faut_du_riz_et_du_sel": "Il nous faut du riz et du sel.",
    "compter_les_articles_en_stock": "compter les articles en stock",
    "cocher_les_elements_achetes": "cocher les éléments achetés",
    "cinq_paquets_de_stylos_bleus": "cinq paquets de stylos bleus",
    "dix_boites_de_craies_blanches": "dix boîtes de craies blanches",
    "tout_est_au_complet": "Tout est au complet !",

    # Week 2: Les commerçants et marchandises
    "le_boucher_a_la_boucherie": "le boucher à la boucherie",
    "le_boulanger_a_la_boulangerie": "le boulanger à la boulangerie",
    "lepicier_a_lepicerie": "l'épicier à l'épicerie",
    "le_poissonnier_a_la_poissonnerie": "le poissonnier à la poissonnerie",
    "le_libraire_a_la_librairie": "le libraire à la librairie",
    "en_boite_de_conserve": "en boîte de conserve",
    "en_bouteille_dhuile": "en bouteille d'huile",
    "en_sachet_de_lait_en_poudre": "en sachet de lait en poudre",
    "vendu_en_vrac_au_kilo": "vendu en vrac au kilo",
    "au_rayon_des_produits_frais": "au rayon des produits frais",

    # Week 3: Acheter et marchander
    "je_voudrais_deux_kilos_de_riz": "Je voudrais deux kilos de riz.",
    "combien_coute_ce_paquet": "Combien coûte ce paquet ?",
    "cest_combien_le_panier": "C'est combien le panier ?",
    "cest_trop_cher_monsieur": "C'est trop cher, monsieur !",
    "faites_moi_un_bon_prix": "Faites-moi un bon prix.",
    "vous_me_faites_une_reduction": "Vous me faites une réduction ?",
    "daccord_je_le_prends": "D'accord, je le prends.",
    "je_paie_en_especes": "Je paie en espèces.",
    "je_regle_par_carte_bancaire": "Je règle par carte bancaire.",
    "voici_votre_monnaie": "Voici votre monnaie.",

    # Week 4: Exprimer un besoin et son utilité
    "jai_besoin_dun_dictionnaire": "J'ai besoin d'un dictionnaire.",
    "a_quoi_sert_cet_outil": "À quoi sert cet outil ?",
    "ca_sert_a_ecrire_des_notes": "Ça sert à écrire des notes.",
    "les_ciseaux_pour_couper_le_papier": "les ciseaux pour couper le papier",
    "la_regle_pour_mesurer_les_lignes": "la règle pour mesurer les lignes",
    "le_balai_pour_nettoyer_la_classe": "le balai pour nettoyer la classe",
    "la_calculatrice_pour_compter": "la calculatrice pour compter",
    "cest_tres_utile_au_quotidien": "C'est très utile au quotidien.",
    "cest_indispensable_pour_le_travail": "C'est indispensable pour le travail.",
    "nous_avons_besoin_daide": "Nous avons besoin d'aide.",

    # Week 5: À la pharmacie
    "je_ne_me_sens_pas_bien": "Je ne me sens pas bien.",
    "jai_mal_a_la_tete": "J'ai mal à la tête.",
    "jai_mal_au_ventre": "J'ai mal au ventre.",
    "jai_mal_a_la_gorge": "J'ai mal à la gorge.",
    "jai_de_la_fievre_et_je_tousse": "J'ai de la fièvre et je tousse.",
    "avez_vous_un_medicament_contre_le_paludisme": "Avez-vous un médicament contre le paludisme ?",
    "prenez_ce_sirop_trois_fois_par_jour": "Prenez ce sirop trois fois par jour.",
    "deux_comprimes_apres_le_repas": "deux comprimés après le repas",
    "une_boite_de_pansements_steriles": "une boîte de pansements stériles",
    "bon_retablissement": "Bon rétablissement !",

    # Week 6: Vêtements, chaussures et accessoires
    "la_chemise_et_le_pantalon": "la chemise et le pantalon",
    "la_robe_et_la_jupe": "la robe et la jupe",
    "les_chaussures_en_cuir_noir": "les chaussures en cuir noir",
    "la_ceinture_et_le_chapeau": "la ceinture et le chapeau",
    "le_pagne_et_lagbada_traditionnel": "le pagne et l'agbada traditionnel",
    "un_tissu_en_coton_doux": "un tissu en coton doux",
    "une_chemise_a_rayures_bleues": "une chemise à rayures bleues",
    "un_pantalon_a_carreaux": "un pantalon à carreaux",
    "quelle_est_votre_taille": "Quelle est votre taille ?",
    "je_fais_du_quarante_deux_en_pointure": "Je fais du quarante-deux en pointure.",

    # Week 7: Apprécier, comparer, choisir
    "cest_vraiment_magnifique": "C'est vraiment magnifique !",
    "cette_robe_est_tres_elegante": "Cette robe est très élégante.",
    "ce_pantalon_est_plus_cher_que_lautre": "Ce pantalon est plus cher que l'autre.",
    "cette_chemise_est_moins_chaude": "Cette chemise est moins chaude.",
    "elle_est_aussi_belle_que_la_rouge": "Elle est aussi belle que la rouge.",
    "jhesite_entre_les_deux_modeles": "J'hésite entre les deux modèles.",
    "je_prefere_celui_ci": "Je préfère celui-ci.",
    "je_prends_celle_la": "Je prends celle-là.",
    "ca_vous_va_a_merveille": "Ça vous va à merveille !",
    "cest_la_meilleure_qualite": "C'est la meilleure qualité.",

    # Week 8: Quantité et qualité des produits
    "un_kilo_de_tomates_bien_mures": "un kilo de tomates bien mûres",
    "un_demi_kilo_doignons_frais": "un demi-kilo d'oignons frais",
    "deux_cent_cinquante_grammes_de_beurre": "deux cent cinquante grammes de beurre",
    "un_litre_dhuile_darachide": "un litre d'huile d'arachide",
    "une_douzaine_doeufs_frais": "une douzaine d'œufs frais",
    "un_morceau_digname_blanche": "un morceau d'igname blanche",
    "une_tranche_dananas_sucre": "une tranche d'ananas sucré",
    "des_produits_biologiques_et_naturels": "des produits biologiques et naturels",
    "cest_de_la_premiere_qualite": "C'est de la première qualité.",
    "des_fruits_delicieux_et_parfumes": "des fruits délicieux et parfumés",

    # Week 9: Grand Rallye
    "bienvenue_au_grand_rallye_du_deuxieme_trimestre": "Bienvenue au Grand Rallye du deuxième trimestre !",
    "coup_de_buzzer_pour_lequipe_verte": "Coup de buzzer pour l'Équipe Verte !",
    "excellente_reponse_dix_points_marques": "Excellente réponse, dix points marqués !",
    "derniere_ligne_droite_du_championnat": "Dernière ligne droite du championnat !",
    "felicitations_aux_vainqueurs_du_deuxieme_trimestre": "Félicitations aux vainqueurs du deuxième trimestre !",
}


async def generate_clip(key: str, text: str, semaphore: asyncio.Semaphore):
    async with semaphore:
        filename = os.path.join(OUTPUT_DIR, f"{key}.mp3")
        communicate = edge_tts.Communicate(text, VOICE, rate=RATE)
        await communicate.save(filename)
        print(f"[OK] Generated: {key}.mp3 -> '{text}'")


async def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    semaphore = asyncio.Semaphore(5)
    tasks = [generate_clip(key, text, semaphore) for key, text in CLIPS.items()]
    await asyncio.gather(*tasks)
    print(f"\n[DONE] Successfully generated all {len(CLIPS)} audio files into {OUTPUT_DIR}")


if __name__ == "__main__":
    asyncio.run(main())
