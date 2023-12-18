# Étape 1 : Lecture de l'entrée
input = File.read('input.txt')

# Séparation des graines et des cartes
seeds, *maps = input.split("\n\n")

# Extraction des graines en convertissant les valeurs en entiers
seeds = seeds.split[1..].map(&:to_i)

# Traitement des cartes en convertissant les valeurs en entiers et en conservant uniquement la partie pertinente
maps = maps.map { |line| line.split.map(&:to_i)[2..] }

# Étape 2 : Logique de conversion
conv = seeds.map do |seed|
  # Itération sur chaque graine pour la convertir à travers les différentes cartes
  maps.reduce(seed) do |current_seed, map_segment|
    # Découpage de chaque ligne de la carte en groupes de trois
    map_ranges = map_segment.each_slice(3)

    # Recherche de la première plage dans la carte où la graine se situe
    matching_range = map_ranges.find { |(_, start, length)| current_seed >= start && current_seed < start + length }

    # Si une plage correspondante est trouvée, effectuer la conversion
    if matching_range
      current_seed - matching_range[1] + matching_range[0]
    else
      # Si aucune plage correspondante n'est trouvée, conserver la graine inchangée
      current_seed
    end
  end
end

# Étape 3 : Affichage du résultat
puts 'Partie 1:', conv.min
