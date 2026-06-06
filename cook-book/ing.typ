#import "recipe-lib.typ": ing

// --- INTERNAL HELPER ---
// Creates a wrapper for an ingredient.
// base: What do the nutrition values refer to? (Default: 100g or 1 item)
#let create(name, unit, base: 100, kcal: 0, prot: 0, carbs: 0, fat: 0) = {
  return  amount => {
    // Calculate the ratio (e.g., 500g / 100g Base = Factor 5)
    let ratio = amount / base

    // Call the original Loom-Ing, but scale up the nutrition values
    ing(
      name,
      amount,
      unit: unit,
      kcal: kcal * ratio,
      prot: prot * ratio,
      carbs: carbs * ratio,
      fat: fat * ratio,
    )
  } 
}// create 是一个函数工厂，用于批量创建匿名函数？ 

// --- VEGETABLES ---
// Nutrition per 100g
// tomato 是一个函数变量，tomato变量的值是一个函数，tomato(750)就是在调用create这个函数返回的匿名函数。
#let tomato = create("Tomatoes", "g", kcal: 18, prot: 0.9, carbs: 3.9, fat: 0.2)
#let onion = create(
  "Onion",
  "pcs", 
  base: 1,
  kcal: 40,
  prot: 1.1,
  carbs: 9.3,
  fat: 0.1,
) // per piece
#let garlic = create(
  "Garlic",
  "clove",
  base: 1,
  kcal: 4,
  prot: 0.2,
  carbs: 1,
  fat: 0,
) // per clove
#let basil = create(
  "Basil",
  "handful",
  base: 1,
  kcal: 2,
  prot: 0.1,
  carbs: 0.1,
  fat: 0,
)

// --- LIQUIDS & BASICS ---
#let oil = create("Olive Oil", "tbsp", base: 1, kcal: 119, fat: 13.5) // per tablespoon (approx. 13.5g)
#let stock = create("Veg Stock", "ml", kcal: 5, prot: 0.5, carbs: 1, fat: 0.2)
#let cream = create(
  "Heavy Cream",
  "ml",
  kcal: 290,
  prot: 2.3,
  carbs: 3.4,
  fat: 30,
)

// --- SPICES ---
// Spices often have negligible calories, we can leave them at 0 or define a base
#let salt_pep = create("Salt & Pepper", "pinch", base: 1, kcal: 0)
