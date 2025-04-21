while read -r line; do
    found=$(echo "$line" | grep -o -E " \
Agelas oroides|Aplysina aerophoba|Chondrosia reniformis|Halichondria panicea|Halisarca caerulea|Oscarella lobularis|Petrosia ficiformis|Pione vastifica|Callyspongia serpentina| \
Ircinia cf. reteplana|Ephydatia muelleri|Ephydatia sp.|Eunapius fragilis|Hexactinellid|Hyattella lendenfeldi|Hymedesmia methanophila|Iophon|Pandaros acanthifolium|Pione vastifica| \
Axinella verrucosa|Eunapius fragilis|Geodia parva|Tedania charcoti|Xestospongia bergquistia|Spongia barbara|Spongilla sp.|Suberites sp.|Suberitidae sp.|Tedania sp.|Terpios hoshinota| \
Spongia barbara|Hymedesmia methanophila|Xestospongia bergquistia|Xestospongia sp.|Cinachyrella australiensis|Corticium candelabrum|Darwinella sp.|Haliclona sp.|Clathrinidae sponge| \
Poecilosclerida sponge|Acanthascus dawsoni|Halichondria sp.|Aphrocallistes vastus|Geodia sp.|Dragmacidon mexicanum|Lissodendoryx nobilis|Anoxycalyx joubini|Haliclonissa verrucosa| \
Inflatella pellicula|Lissodendoryx diversichela|Poecillastra compressa|Stelleta normani|Phakellia ventilabrum|Antho dichotoma|Sycon ciliatum|Ecionemia alata|Halichondria bowerbanki| \
Axinella mexicana|Hexactinellida|Haliclona simulans|Agelas oroides|Agelas tubulata|Aplysina aerophoba|Chondrosia reniformis|Coelocarteria singaporensis|Ircinia campana|Ircinia felix| \
Ircinia ramosa|Ircinia sp.|Ircinia strobilina|Melophlus sp.|Petrosia ficiformis|Pseudoceratina sp.|Rhopaloeides odorabile|Theonella swinhoei|Amphimedon queenslandica|Cliona orientalis| \
Halichondria panicea|Halichondria sitiens|Haliclona cymaeformis|Haliclona oculata|Halisarca caerulea|Ianthella basta|Isodictya palmata|Lamellodysidea herbacea|Mycale hentscheli| \
Oscarella lobularis|Phyllospongia foliascens|Stylissa flabelliformis|Vazella pourtalesii|Coscinoderma mathewsi|Cymbastela coralliophila|Haliclona xena|Haplosclerida sp.|Hymeniacidon sp.| \
Ircinia reteplana|Llamelodysidea herbacea|Lophophysema sp.|Neamphius huxleyi|Porites lutea|Spongilla lacustris|Tedaniidae sp.|Tethya californiana|Thoosa mismalolli|Haliclona xena| \
Tethya californiana|Hymeniacidon|Ircinia reteplana|Ircinia|Halisarca caerulea|Halichondria sitiens|Aaptos lobata|Hyrtios erectus|Pseudoceratina purpurea|Xestospongia testudinaria| \
Acanthella cavernosa|Echinodictyum asperum|Jaspis splendens|Ptilocaulis spiculifer|Stylissa carteri|Suberites diversicolor|Ircinia fasciculata|Ircinia oros|Ircinia variabilis| \
Sarcotragus spinosulus|Spongia officinalis|Chondrilla nucula|Chondrosia reniformis|Aplysina cauliformis|Agelas oroides|Petrosia ficiformis|Ancorina alata|Dysidea avara| \
Axinella corrugata|Axinella damicornis|Cymbastela concentrica|Spirastrella cunctatrix|Callyspongia|Mycale hentscheli|Halichondria panicea|Hymeniacidon sinapium|Stylinos| \
Tethya stolonifera|Coscinoderma mathewsi|Cymbastela coralliophila|Thoosa mismalolli|Hymeniacidon heliophila|Tsitsikamma favus|Crella incrustans|Crambe crambe|Scopalina| \
Amphimedon queenslandica|Iophon methanophila|Agelas tubulata|Melophlus|Pseudoceratina|Coelocarteria singaporensis|Ircinia ramosa|Geodia barretti|Hymedesmia paupertas| \
Vazella pourtalesii|Agelas conifera|Aiolochroia crassa|Aplysina archeri|Aplysina fulva|Aplysina lacunosa|Ectyoplasia ferox|Geodia neptuni|lotrochota birotulata|Ircinia felix| \
Ircinia strobilina|Plakortis|Spheciospongia vesparium|Xestospongia muta|Amphimedon compressa|Callyspongia armigera|Callyspongia plicifera|Callyspongia vaginalis|Mycale laxissima| \
Niphates digitalis|Niphates erecta|Ptilocaulis|Stylissa cf. flabelliformis|Cliona orientalis|Ircinia campana|Acanthostrongylophora ingens|Neopetrosia chaliniformis|Petrosia hoeksemai| \
Petrosia nigricans|Theonella swinhoei|Xestospongia vansoesti|Callyspongia biru|Callyspongia samarensis|Clathria basilana|Clathria cervicornis|Clathria reinwardti|Halichondria cartilaginea| \
Haliclona cymaeformis|Haliclona fascigera|Lamellodysidea herbacea|Leucetta chagosensis|Leucetta primiginea|Niphates olemda|Pericharax orientalis|Phyllospongia foliascens| \
Phyllospongia papyracea|Agelas citrina|Agelas dilatata|Agelas dispar|Agelas wiedenmayeri|Aplysina aerophoba|Aplysina cauliformis|Aplysina cavernicola|Aplysina fistularis|  \
Aplysina insularis|Cribrochalina vasculum|Myrmekioderma gyroderma|Petrosia|Plakortis lita|Siphonodictyon coralliphagum|Smenospongia aurea|Svenzea zeai|Verongula gigantea| \
Acanthella acuta|Amphimedon ochracea|Axinella cannabina|Axinella polypoides|Batzella rubra|Chalinula molitba|Cinachyrella alloclada|Cliona varians|Crella cyathophora| \
Dysidea etheria|Erylus formosus|Iotrochota birotulata|Monanchora arbuscula|Oscarella lobularis|Scopalina ruetzleri|Suberites domuncula|Tedania ignis|Tethya aurantium| \
Rhopaloeides odorabile|Dysidea fragilis|Stelletta maori|Ianthella basta|Stylissa massa|Rhabdastrella globostellata \
" | head -n 1)
    if [ -z "$found" ]; then
        printf "ND\t%s\n" "$line"
    else
        printf "%s\t%s\n" "$found" "$line"
    fi
done < $1
