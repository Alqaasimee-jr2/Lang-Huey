import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jss2_french/data/jss2_term1_lessons.dart';
import 'package:jss2_french/data/jss2_term2_lessons.dart';
import 'package:jss2_french/data/jss2_term3_lessons.dart';
import 'package:jss2_french/screens/term/jss2_term_select_screen.dart';
import 'package:jss2_french/screens/roadmap/jss2_week_roadmap_screen.dart';
import 'package:jss2_french/screens/lesson/jss2_lesson_player_screen.dart';

import 'package:jss2_french/widgets/patterns/term1/jss2_spatial_position_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term1/jss2_locating_places_studio_widget.dart';

// Term 2 Widgets
import 'package:jss2_french/widgets/patterns/term2/jss2_list_and_inventory_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_merchants_and_goods_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_shopping_and_bargaining_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_needs_and_utility_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_pharmacy_and_health_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_wardrobe_and_style_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_comparison_and_choice_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_product_quantity_quality_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term2/jss2_term2_revision_rally_widget.dart';

// Term 3 Widgets
import 'package:jss2_french/widgets/patterns/term3/jss2_math_calculations_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_food_and_drinks_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_cooking_recipes_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_restaurant_cafe_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_integrated_role_play_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_consolidation_exercises_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_guided_conversations_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_exam_prep_studio_widget.dart';
import 'package:jss2_french/widgets/patterns/term3/jss2_grand_rally_studio_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrapTestable(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('JSS2 Smartboard UI Widget Fit Tests (1080p / 4K)', () {
    testWidgets('1. JSS2TermSelectScreen renders term cards and header branding', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(wrapTestable(const JSS2TermSelectScreen()));
      await tester.pumpAndSettle();

      expect(find.text('LANG HUEY'), findsOneWidget);
      expect(find.text('JSS 2 FRENCH'), findsOneWidget);
      expect(find.text('PREMIER TRIMESTRE'), findsOneWidget);
      expect(find.text('DEUXIÈME TRIMESTRE'), findsOneWidget);
    });

    testWidgets('2. JSS2WeekRoadmapScreen renders all 9 week cards for Term 1 and Term 2', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      // Term 1
      await tester.pumpWidget(wrapTestable(const JSS2WeekRoadmapScreen(term: 1)));
      await tester.pumpAndSettle();
      expect(find.text('SEMAINE 1'), findsOneWidget);
      expect(find.text('SEMAINE 9'), findsOneWidget);

      // Term 2
      await tester.pumpWidget(wrapTestable(const JSS2WeekRoadmapScreen(term: 2)));
      await tester.pumpAndSettle();
      expect(find.text('SEMAINE 1'), findsOneWidget);
      expect(find.text('SEMAINE 9'), findsOneWidget);
    });

    // Term 1 Pattern Tests
    testWidgets('3. Term 1 Week 1 JSS2SpatialPositionStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term1Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS2SpatialPositionStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio Spatial 3D : Positions Relatives'), findsOneWidget);
      expect(find.text('sur'), findsOneWidget);
      expect(find.text('sous'), findsOneWidget);
    });

    testWidgets('4. Term 1 Week 2 JSS2LocatingPlacesStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term1Lessons.weeks[1];
      await tester.pumpWidget(wrapTestable(JSS2LocatingPlacesStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Carte Interactive de la Ville : Situer les Lieux'), findsOneWidget);
      expect(find.text('La poste'), findsWidgets);
    });

    // Term 2 Pattern Tests
    testWidgets('5. Term 2 Week 1 JSS2ListAndInventoryStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS2ListAndInventoryStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio d\'Inventaire & Listes de Courses'), findsOneWidget);
      expect(find.text('Fournitures Scolaires'), findsWidgets);
    });

    testWidgets('6. Term 2 Week 2 JSS2MerchantsAndGoodsStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[1];
      await tester.pumpWidget(wrapTestable(JSS2MerchantsAndGoodsStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Marché des Commerçants & Modes de Présentation'), findsOneWidget);
      expect(find.text('Le Boucher'), findsOneWidget);
    });

    testWidgets('7. Term 2 Week 3 JSS2ShoppingAndBargainingStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[2];
      await tester.pumpWidget(wrapTestable(JSS2ShoppingAndBargainingStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Simulateur de Marchandage & Négociation au Marché'), findsOneWidget);
      expect(find.text('Négocier'), findsOneWidget);
    });

    testWidgets('8. Term 2 Week 4 JSS2NeedsAndUtilityStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[3];
      await tester.pumpWidget(wrapTestable(JSS2NeedsAndUtilityStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Atelier des Besoins & Utilité : « À quoi ça sert ? »'), findsOneWidget);
      expect(find.text('Les ciseaux'), findsWidgets);
    });

    testWidgets('9. Term 2 Week 5 JSS2PharmacyAndHealthStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[4];
      await tester.pumpWidget(wrapTestable(JSS2PharmacyAndHealthStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Guichet de la Pharmacie : Symptômes & Posologie'), findsOneWidget);
      expect(find.text('Mal de tête'), findsWidgets);
    });

    testWidgets('10. Term 2 Week 6 JSS2WardrobeAndStyleStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[5];
      await tester.pumpWidget(wrapTestable(JSS2WardrobeAndStyleStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio Stylisme & Garde-Robe : Tenues, Matières & Tailles'), findsOneWidget);
      expect(find.text('La chemise'), findsWidgets);
    });

    testWidgets('11. Term 2 Week 7 JSS2ComparisonAndChoiceStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[6];
      await tester.pumpWidget(wrapTestable(JSS2ComparisonAndChoiceStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Arène de Comparaison & Prise de Décision'), findsOneWidget);
      expect(find.text('« Je préfère celui-ci »'), findsOneWidget);
    });

    testWidgets('12. Term 2 Week 8 JSS2ProductQuantityQualityStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[7];
      await tester.pumpWidget(wrapTestable(JSS2ProductQuantityQualityStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Laboratoire des Mesures Métriques & Qualité des Produits'), findsOneWidget);
      expect(find.text('Moins'), findsOneWidget);
      expect(find.text('Plus'), findsOneWidget);
    });

    testWidgets('13. Term 2 Week 9 JSS2Term2RevisionRallyWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[8];
      await tester.pumpWidget(wrapTestable(JSS2Term2RevisionRallyWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Grand Rallye du 2e Trimestre : Championnat JSS 2'), findsOneWidget);
      expect(find.text('Équipe Bleue'), findsOneWidget);
      expect(find.text('Équipe Verte'), findsOneWidget);
    });

    testWidgets('14. JSS2LessonPlayerScreen loads and switches phases smoothly for Term 2', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term2Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS2LessonPlayerScreen(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Objectifs Pédagogiques de la Semaine :'), findsOneWidget);
      expect(find.text('2. Lab Interactif'), findsOneWidget);

      await tester.tap(find.text('2. Lab Interactif'));
      await tester.pumpAndSettle();

      expect(find.text('Studio d\'Inventaire & Listes de Courses'), findsOneWidget);
    });

    // ─────────────────────────────────────────────────────────
    // Term 3 Pattern Tests
    // ─────────────────────────────────────────────────────────
    testWidgets('15. Term 3 Week 1 JSS2MathCalculationsStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS2MathCalculationsStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Calcul — Les 4 Opérations'), findsOneWidget);
      expect(find.text('Calculer'), findsOneWidget);
      expect(find.text('Marché'), findsOneWidget);
    });

    testWidgets('16. Term 3 Week 2 JSS2FoodAndDrinksStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[1];
      await tester.pumpWidget(wrapTestable(JSS2FoodAndDrinksStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('La Table Africaine & Française'), findsOneWidget);
      expect(find.text('Repas'), findsOneWidget);
      expect(find.text('Préférences'), findsOneWidget);
    });

    testWidgets('17. Term 3 Week 3 JSS2CookingRecipesStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[2];
      await tester.pumpWidget(wrapTestable(JSS2CookingRecipesStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Recettes — Cuisine Mondiale'), findsOneWidget);
      expect(find.text('Recette'), findsOneWidget);
    });

    testWidgets('18. Term 3 Week 4 JSS2RestaurantCafeStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[3];
      await tester.pumpWidget(wrapTestable(JSS2RestaurantCafeStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Le Bistrot Franco-Nigérian'), findsOneWidget);
      expect(find.text('Réservation'), findsOneWidget);
      expect(find.text('Carte & Commande'), findsOneWidget);
    });

    testWidgets('19. Term 3 Week 5 JSS2IntegratedRolePlayStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[4];
      await tester.pumpWidget(wrapTestable(JSS2IntegratedRolePlayStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.textContaining('Jeu de Rôle :'), findsWidgets);
    });

    testWidgets('20. Term 3 Week 6 JSS2ConsolidationExercisesStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[5];
      await tester.pumpWidget(wrapTestable(JSS2ConsolidationExercisesStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Révision 4 Stations — Unités 17–20'), findsOneWidget);
      expect(find.text('Calcul'), findsOneWidget);
      expect(find.text('Nourriture'), findsOneWidget);
    });

    testWidgets('21. Term 3 Week 7 JSS2GuidedConversationsStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[6];
      await tester.pumpWidget(wrapTestable(JSS2GuidedConversationsStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Conversations Guidées'), findsOneWidget);
      expect(find.text('Prompts'), findsOneWidget);
      expect(find.text('Liaison'), findsOneWidget);
    });

    testWidgets('22. Term 3 Week 8 JSS2ExamPrepStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[7];
      await tester.pumpWidget(wrapTestable(JSS2ExamPrepStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Préparation aux Examens'), findsOneWidget);
      expect(find.text('QCM'), findsOneWidget);
      expect(find.text('Erreurs'), findsOneWidget);
    });

    testWidgets('23. Term 3 Week 9 JSS2GrandRallyStudioWidget renders correctly', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[8];
      await tester.pumpWidget(wrapTestable(JSS2GrandRallyStudioWidget(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('GRAND RALLY — JSS 2 FRANÇAIS'), findsOneWidget);
      expect(find.text('Trophées'), findsOneWidget);
      expect(find.text('Rally Quiz'), findsOneWidget);
      expect(find.text('Certificat'), findsOneWidget);
    });

    testWidgets('24. JSS2LessonPlayerScreen loads and switches phases smoothly for Term 3', (tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      final lesson = JSS2Term3Lessons.weeks[0];
      await tester.pumpWidget(wrapTestable(JSS2LessonPlayerScreen(lesson: lesson)));
      await tester.pumpAndSettle();

      expect(find.text('Objectifs Pédagogiques de la Semaine :'), findsOneWidget);
      expect(find.text('2. Lab Interactif'), findsOneWidget);

      await tester.tap(find.text('2. Lab Interactif'));
      await tester.pumpAndSettle();

      expect(find.text('Studio de Calcul — Les 4 Opérations'), findsOneWidget);
    });
  });
}
