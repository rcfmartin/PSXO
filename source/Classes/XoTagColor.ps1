class XoTagColor : System.Management.Automation.IValidateSetValuesGenerator
{
  [string[]] GetValidValues()
  {
    return @($this.GetAllColors().psobject.properties.Name)
  }

  [psobject]GetAllColors()
  {
    $jsonColors = @'
{
  "air_force_blue_raf": {
    "name": "Air Force Blue (Raf)",
    "hex": "#5d8aa8",
    "rgb": [93, 138, 168],
  },
  "air_force_blue_usaf": {
    "name": "Air Force Blue (Usaf)",
    "hex": "#00308f",
    "rgb": [0, 48, 143],
  },
  "air_superiority_blue": {
    "name": "Air Superiority Blue",
    "hex": "#72a0c1",
    "rgb": [114, 160, 193],
  },
  "alabama_crimson": {
    "name": "Alabama Crimson",
    "hex": "#a32638",
    "rgb": [163, 38, 56],
  },
  "alice_blue": {
    "name": "Alice Blue",
    "hex": "#f0f8ff",
    "rgb": [240, 248, 255],
  },
  "alizarin_crimson": {
    "name": "Alizarin Crimson",
    "hex": "#e32636",
    "rgb": [227, 38, 54],
  },
  "alloy_orange": {
    "name": "Alloy Orange",
    "hex": "#c46210",
    "rgb": [196, 98, 16],
  },
  "almond": {
    "name": "Almond",
    "hex": "#efdecd",
    "rgb": [239, 222, 205],
  },
  "amaranth": {
    "name": "Amaranth",
    "hex": "#e52b50",
    "rgb": [229, 43, 80],
  },
  "amber": {
    "name": "Amber",
    "hex": "#ffbf00",
    "rgb": [255, 191, 0],
  },
  "amber_sae_ece": {
    "name": "Amber (Sae/Ece)",
    "hex": "#ff7e00",
    "rgb": [255, 126, 0],
  },
  "american_rose": {
    "name": "American Rose",
    "hex": "#ff033e",
    "rgb": [255, 3, 62],
  },
  "amethyst": {
    "name": "Amethyst",
    "hex": "#96c",
    "rgb": [153, 102, 204],
  },
  "android_green": {
    "name": "Android Green",
    "hex": "#a4c639",
    "rgb": [164, 198, 57],
  },
  "anti_flash_white": {
    "name": "Anti-Flash White",
    "hex": "#f2f3f4",
    "rgb": [242, 243, 244],
  },
  "antique_brass": {
    "name": "Antique Brass",
    "hex": "#cd9575",
    "rgb": [205, 149, 117],
  },
  "antique_fuchsia": {
    "name": "Antique Fuchsia",
    "hex": "#915c83",
    "rgb": [145, 92, 131],
  },
  "antique_ruby": {
    "name": "Antique Ruby",
    "hex": "#841b2d",
    "rgb": [132, 27, 45],
  },
  "antique_white": {
    "name": "Antique White",
    "hex": "#faebd7",
    "rgb": [250, 235, 215],
  },
  "ao_english": {
    "name": "Ao (English)",
    "hex": "#008000",
    "rgb": [0, 128, 0],
  },
  "apple_green": {
    "name": "Apple Green",
    "hex": "#8db600",
    "rgb": [141, 182, 0],
  },
  "apricot": {
    "name": "Apricot",
    "hex": "#fbceb1",
    "rgb": [251, 206, 177],
  },
  "aqua": {
    "name": "Aqua",
    "hex": "#0ff",
    "rgb": [0, 255, 255],
  },
  "aquamarine": {
    "name": "Aquamarine",
    "hex": "#7fffd4",
    "rgb": [127, 255, 212],
  },
  "army_green": {
    "name": "Army Green",
    "hex": "#4b5320",
    "rgb": [75, 83, 32],
  },
  "arsenic": {
    "name": "Arsenic",
    "hex": "#3b444b",
    "rgb": [59, 68, 75],
  },
  "arylide_yellow": {
    "name": "Arylide Yellow",
    "hex": "#e9d66b",
    "rgb": [233, 214, 107],
  },
  "ash_grey": {
    "name": "Ash Grey",
    "hex": "#b2beb5",
    "rgb": [178, 190, 181],
  },
  "asparagus": {
    "name": "Asparagus",
    "hex": "#87a96b",
    "rgb": [135, 169, 107],
  },
  "atomic_tangerine": {
    "name": "Atomic Tangerine",
    "hex": "#f96",
    "rgb": [255, 153, 102],
  },
  "auburn": {
    "name": "Auburn",
    "hex": "#a52a2a",
    "rgb": [165, 42, 42],
  },
  "aureolin": {
    "name": "Aureolin",
    "hex": "#fdee00",
    "rgb": [253, 238, 0],
  },
  "aurometalsaurus": {
    "name": "Aurometalsaurus",
    "hex": "#6e7f80",
    "rgb": [110, 127, 128],
  },
  "avocado": {
    "name": "Avocado",
    "hex": "#568203",
    "rgb": [86, 130, 3],
  },
  "azure": {
    "name": "Azure",
    "hex": "#007fff",
    "rgb": [0, 127, 255],
  },
  "azure_mist_web": {
    "name": "Azure Mist/Web",
    "hex": "#f0ffff",
    "rgb": [240, 255, 255],
  },
  "baby_blue": {
    "name": "Baby Blue",
    "hex": "#89cff0",
    "rgb": [137, 207, 240],
  },
  "baby_blue_eyes": {
    "name": "Baby Blue Eyes",
    "hex": "#a1caf1",
    "rgb": [161, 202, 241],
  },
  "baby_pink": {
    "name": "Baby Pink",
    "hex": "#f4c2c2",
    "rgb": [244, 194, 194],
  },
  "ball_blue": {
    "name": "Ball Blue",
    "hex": "#21abcd",
    "rgb": [33, 171, 205],
  },
  "banana_mania": {
    "name": "Banana Mania",
    "hex": "#fae7b5",
    "rgb": [250, 231, 181],
  },
  "banana_yellow": {
    "name": "Banana Yellow",
    "hex": "#ffe135",
    "rgb": [255, 225, 53],
  },
  "barn_red": {
    "name": "Barn Red",
    "hex": "#7c0a02",
    "rgb": [124, 10, 2],
  },
  "battleship_grey": {
    "name": "Battleship Grey",
    "hex": "#848482",
    "rgb": [132, 132, 130],
  },
  "bazaar": {
    "name": "Bazaar",
    "hex": "#98777b",
    "rgb": [152, 119, 123],
  },
  "beau_blue": {
    "name": "Beau Blue",
    "hex": "#bcd4e6",
    "rgb": [188, 212, 230],
  },
  "beaver": {
    "name": "Beaver",
    "hex": "#9f8170",
    "rgb": [159, 129, 112],
  },
  "beige": {
    "name": "Beige",
    "hex": "#f5f5dc",
    "rgb": [245, 245, 220],
  },
  "big_dip_o_ruby": {
    "name": "Big Dip O’Ruby",
    "hex": "#9c2542",
    "rgb": [156, 37, 66],
  },
  "bisque": {
    "name": "Bisque",
    "hex": "#ffe4c4",
    "rgb": [255, 228, 196],
  },
  "bistre": {
    "name": "Bistre",
    "hex": "#3d2b1f",
    "rgb": [61, 43, 31],
  },
  "bittersweet": {
    "name": "Bittersweet",
    "hex": "#fe6f5e",
    "rgb": [254, 111, 94],
  },
  "bittersweet_shimmer": {
    "name": "Bittersweet Shimmer",
    "hex": "#bf4f51",
    "rgb": [191, 79, 81],
  },
  "black": {
    "name": "Black",
    "hex": "#000",
    "rgb": [0, 0, 0],
  },
  "black_bean": {
    "name": "Black Bean",
    "hex": "#3d0c02",
    "rgb": [61, 12, 2],
  },
  "black_leather_jacket": {
    "name": "Black Leather Jacket",
    "hex": "#253529",
    "rgb": [37, 53, 41],
  },
  "black_olive": {
    "name": "Black Olive",
    "hex": "#3b3c36",
    "rgb": [59, 60, 54],
  },
  "blanched_almond": {
    "name": "Blanched Almond",
    "hex": "#ffebcd",
    "rgb": [255, 235, 205],
  },
  "blast_off_bronze": {
    "name": "Blast-Off Bronze",
    "hex": "#a57164",
    "rgb": [165, 113, 100],
  },
  "bleu_de_france": {
    "name": "Bleu De France",
    "hex": "#318ce7",
    "rgb": [49, 140, 231],
  },
  "blizzard_blue": {
    "name": "Blizzard Blue",
    "hex": "#ace5ee",
    "rgb": [172, 229, 238],
  },
  "blond": {
    "name": "Blond",
    "hex": "#faf0be",
    "rgb": [250, 240, 190],
  },
  "blue": {
    "name": "Blue",
    "hex": "#00f",
    "rgb": [0, 0, 255],
  },
  "blue_bell": {
    "name": "Blue Bell",
    "hex": "#a2a2d0",
    "rgb": [162, 162, 208],
  },
  "blue_crayola": {
    "name": "Blue (Crayola)",
    "hex": "#1f75fe",
    "rgb": [31, 117, 254],
  },
  "blue_gray": {
    "name": "Blue Gray",
    "hex": "#69c",
    "rgb": [102, 153, 204],
  },
  "blue_green": {
    "name": "Blue-Green",
    "hex": "#0d98ba",
    "rgb": [13, 152, 186],
  },
  "blue_munsell": {
    "name": "Blue (Munsell)",
    "hex": "#0093af",
    "rgb": [0, 147, 175],
  },
  "blue_ncs": {
    "name": "Blue (Ncs)",
    "hex": "#0087bd",
    "rgb": [0, 135, 189],
  },
  "blue_pigment": {
    "name": "Blue (Pigment)",
    "hex": "#339",
    "rgb": [51, 51, 153],
  },
  "blue_ryb": {
    "name": "Blue (Ryb)",
    "hex": "#0247fe",
    "rgb": [2, 71, 254],
  },
  "blue_sapphire": {
    "name": "Blue Sapphire",
    "hex": "#126180",
    "rgb": [18, 97, 128],
  },
  "blue_violet": {
    "name": "Blue-Violet",
    "hex": "#8a2be2",
    "rgb": [138, 43, 226],
  },
  "blush": {
    "name": "Blush",
    "hex": "#de5d83",
    "rgb": [222, 93, 131],
  },
  "bole": {
    "name": "Bole",
    "hex": "#79443b",
    "rgb": [121, 68, 59],
  },
  "bondi_blue": {
    "name": "Bondi Blue",
    "hex": "#0095b6",
    "rgb": [0, 149, 182],
  },
  "bone": {
    "name": "Bone",
    "hex": "#e3dac9",
    "rgb": [227, 218, 201],
  },
  "boston_university_red": {
    "name": "Boston University Red",
    "hex": "#c00",
    "rgb": [204, 0, 0],
  },
  "bottle_green": {
    "name": "Bottle Green",
    "hex": "#006a4e",
    "rgb": [0, 106, 78],
  },
  "boysenberry": {
    "name": "Boysenberry",
    "hex": "#873260",
    "rgb": [135, 50, 96],
  },
  "brandeis_blue": {
    "name": "Brandeis Blue",
    "hex": "#0070ff",
    "rgb": [0, 112, 255],
  },
  "brass": {
    "name": "Brass",
    "hex": "#b5a642",
    "rgb": [181, 166, 66],
  },
  "brick_red": {
    "name": "Brick Red",
    "hex": "#cb4154",
    "rgb": [203, 65, 84],
  },
  "bright_cerulean": {
    "name": "Bright Cerulean",
    "hex": "#1dacd6",
    "rgb": [29, 172, 214],
  },
  "bright_green": {
    "name": "Bright Green",
    "hex": "#6f0",
    "rgb": [102, 255, 0],
  },
  "bright_lavender": {
    "name": "Bright Lavender",
    "hex": "#bf94e4",
    "rgb": [191, 148, 228],
  },
  "bright_maroon": {
    "name": "Bright Maroon",
    "hex": "#c32148",
    "rgb": [195, 33, 72],
  },
  "bright_pink": {
    "name": "Bright Pink",
    "hex": "#ff007f",
    "rgb": [255, 0, 127],
  },
  "bright_turquoise": {
    "name": "Bright Turquoise",
    "hex": "#08e8de",
    "rgb": [8, 232, 222],
  },
  "bright_ube": {
    "name": "Bright Ube",
    "hex": "#d19fe8",
    "rgb": [209, 159, 232],
  },
  "brilliant_lavender": {
    "name": "Brilliant Lavender",
    "hex": "#f4bbff",
    "rgb": [244, 187, 255],
  },
  "brilliant_rose": {
    "name": "Brilliant Rose",
    "hex": "#ff55a3",
    "rgb": [255, 85, 163],
  },
  "brink_pink": {
    "name": "Brink Pink",
    "hex": "#fb607f",
    "rgb": [251, 96, 127],
  },
  "british_racing_green": {
    "name": "British Racing Green",
    "hex": "#004225",
    "rgb": [0, 66, 37],
  },
  "bronze": {
    "name": "Bronze",
    "hex": "#cd7f32",
    "rgb": [205, 127, 50],
  },
  "brown_traditional": {
    "name": "Brown (Traditional)",
    "hex": "#964b00",
    "rgb": [150, 75, 0],
  },
  "brown_web": {
    "name": "Brown (Web)",
    "hex": "#a52a2a",
    "rgb": [165, 42, 42],
  },
  "bubble_gum": {
    "name": "Bubble Gum",
    "hex": "#ffc1cc",
    "rgb": [255, 193, 204],
  },
  "bubbles": {
    "name": "Bubbles",
    "hex": "#e7feff",
    "rgb": [231, 254, 255],
  },
  "buff": {
    "name": "Buff",
    "hex": "#f0dc82",
    "rgb": [240, 220, 130],
  },
  "bulgarian_rose": {
    "name": "Bulgarian Rose",
    "hex": "#480607",
    "rgb": [72, 6, 7],
  },
  "burgundy": {
    "name": "Burgundy",
    "hex": "#800020",
    "rgb": [128, 0, 32],
  },
  "burlywood": {
    "name": "Burlywood",
    "hex": "#deb887",
    "rgb": [222, 184, 135],
  },
  "burnt_orange": {
    "name": "Burnt Orange",
    "hex": "#c50",
    "rgb": [204, 85, 0],
  },
  "burnt_sienna": {
    "name": "Burnt Sienna",
    "hex": "#e97451",
    "rgb": [233, 116, 81],
  },
  "burnt_umber": {
    "name": "Burnt Umber",
    "hex": "#8a3324",
    "rgb": [138, 51, 36],
  },
  "byzantine": {
    "name": "Byzantine",
    "hex": "#bd33a4",
    "rgb": [189, 51, 164],
  },
  "byzantium": {
    "name": "Byzantium",
    "hex": "#702963",
    "rgb": [112, 41, 99],
  },
  "cadet": {
    "name": "Cadet",
    "hex": "#536872",
    "rgb": [83, 104, 114],
  },
  "cadet_blue": {
    "name": "Cadet Blue",
    "hex": "#5f9ea0",
    "rgb": [95, 158, 160],
  },
  "cadet_grey": {
    "name": "Cadet Grey",
    "hex": "#91a3b0",
    "rgb": [145, 163, 176],
  },
  "cadmium_green": {
    "name": "Cadmium Green",
    "hex": "#006b3c",
    "rgb": [0, 107, 60],
  },
  "cadmium_orange": {
    "name": "Cadmium Orange",
    "hex": "#ed872d",
    "rgb": [237, 135, 45],
  },
  "cadmium_red": {
    "name": "Cadmium Red",
    "hex": "#e30022",
    "rgb": [227, 0, 34],
  },
  "cadmium_yellow": {
    "name": "Cadmium Yellow",
    "hex": "#fff600",
    "rgb": [255, 246, 0],
  },
  "caf_au_lait": {
    "name": "Café Au Lait",
    "hex": "#a67b5b",
    "rgb": [166, 123, 91],
  },
  "caf_noir": {
    "name": "Café Noir",
    "hex": "#4b3621",
    "rgb": [75, 54, 33],
  },
  "cal_poly_green": {
    "name": "Cal Poly Green",
    "hex": "#1e4d2b",
    "rgb": [30, 77, 43],
  },
  "cambridge_blue": {
    "name": "Cambridge Blue",
    "hex": "#a3c1ad",
    "rgb": [163, 193, 173],
  },
  "camel": {
    "name": "Camel",
    "hex": "#c19a6b",
    "rgb": [193, 154, 107],
  },
  "cameo_pink": {
    "name": "Cameo Pink",
    "hex": "#efbbcc",
    "rgb": [239, 187, 204],
  },
  "camouflage_green": {
    "name": "Camouflage Green",
    "hex": "#78866b",
    "rgb": [120, 134, 107],
  },
  "canary_yellow": {
    "name": "Canary Yellow",
    "hex": "#ffef00",
    "rgb": [255, 239, 0],
  },
  "candy_apple_red": {
    "name": "Candy Apple Red",
    "hex": "#ff0800",
    "rgb": [255, 8, 0],
  },
  "candy_pink": {
    "name": "Candy Pink",
    "hex": "#e4717a",
    "rgb": [228, 113, 122],
  },
  "capri": {
    "name": "Capri",
    "hex": "#00bfff",
    "rgb": [0, 191, 255],
  },
  "caput_mortuum": {
    "name": "Caput Mortuum",
    "hex": "#592720",
    "rgb": [89, 39, 32],
  },
  "cardinal": {
    "name": "Cardinal",
    "hex": "#c41e3a",
    "rgb": [196, 30, 58],
  },
  "caribbean_green": {
    "name": "Caribbean Green",
    "hex": "#0c9",
    "rgb": [0, 204, 153],
  },
  "carmine": {
    "name": "Carmine",
    "hex": "#960018",
    "rgb": [150, 0, 24],
  },
  "carmine_m_p": {
    "name": "Carmine (M&P)",
    "hex": "#d70040",
    "rgb": [215, 0, 64],
  },
  "carmine_pink": {
    "name": "Carmine Pink",
    "hex": "#eb4c42",
    "rgb": [235, 76, 66],
  },
  "carmine_red": {
    "name": "Carmine Red",
    "hex": "#ff0038",
    "rgb": [255, 0, 56],
  },
  "carnation_pink": {
    "name": "Carnation Pink",
    "hex": "#ffa6c9",
    "rgb": [255, 166, 201],
  },
  "carnelian": {
    "name": "Carnelian",
    "hex": "#b31b1b",
    "rgb": [179, 27, 27],
  },
  "carolina_blue": {
    "name": "Carolina Blue",
    "hex": "#99badd",
    "rgb": [153, 186, 221],
  },
  "carrot_orange": {
    "name": "Carrot Orange",
    "hex": "#ed9121",
    "rgb": [237, 145, 33],
  },
  "catalina_blue": {
    "name": "Catalina Blue",
    "hex": "#062a78",
    "rgb": [6, 42, 120],
  },
  "ceil": {
    "name": "Ceil",
    "hex": "#92a1cf",
    "rgb": [146, 161, 207],
  },
  "celadon": {
    "name": "Celadon",
    "hex": "#ace1af",
    "rgb": [172, 225, 175],
  },
  "celadon_blue": {
    "name": "Celadon Blue",
    "hex": "#007ba7",
    "rgb": [0, 123, 167],
  },
  "celadon_green": {
    "name": "Celadon Green",
    "hex": "#2f847c",
    "rgb": [47, 132, 124],
  },
  "celeste_colour": {
    "name": "Celeste (Colour)",
    "hex": "#b2ffff",
    "rgb": [178, 255, 255],
  },
  "celestial_blue": {
    "name": "Celestial Blue",
    "hex": "#4997d0",
    "rgb": [73, 151, 208],
  },
  "cerise": {
    "name": "Cerise",
    "hex": "#de3163",
    "rgb": [222, 49, 99],
  },
  "cerise_pink": {
    "name": "Cerise Pink",
    "hex": "#ec3b83",
    "rgb": [236, 59, 131],
  },
  "cerulean": {
    "name": "Cerulean",
    "hex": "#007ba7",
    "rgb": [0, 123, 167],
  },
  "cerulean_blue": {
    "name": "Cerulean Blue",
    "hex": "#2a52be",
    "rgb": [42, 82, 190],
  },
  "cerulean_frost": {
    "name": "Cerulean Frost",
    "hex": "#6d9bc3",
    "rgb": [109, 155, 195],
  },
  "cg_blue": {
    "name": "Cg Blue",
    "hex": "#007aa5",
    "rgb": [0, 122, 165],
  },
  "cg_red": {
    "name": "Cg Red",
    "hex": "#e03c31",
    "rgb": [224, 60, 49],
  },
  "chamoisee": {
    "name": "Chamoisee",
    "hex": "#a0785a",
    "rgb": [160, 120, 90],
  },
  "champagne": {
    "name": "Champagne",
    "hex": "#fad6a5",
    "rgb": [250, 214, 165],
  },
  "charcoal": {
    "name": "Charcoal",
    "hex": "#36454f",
    "rgb": [54, 69, 79],
  },
  "charm_pink": {
    "name": "Charm Pink",
    "hex": "#e68fac",
    "rgb": [230, 143, 172],
  },
  "chartreuse_traditional": {
    "name": "Chartreuse (Traditional)",
    "hex": "#dfff00",
    "rgb": [223, 255, 0],
  },
  "chartreuse_web": {
    "name": "Chartreuse (Web)",
    "hex": "#7fff00",
    "rgb": [127, 255, 0],
  },
  "cherry": {
    "name": "Cherry",
    "hex": "#de3163",
    "rgb": [222, 49, 99],
  },
  "cherry_blossom_pink": {
    "name": "Cherry Blossom Pink",
    "hex": "#ffb7c5",
    "rgb": [255, 183, 197],
  },
  "chestnut": {
    "name": "Chestnut",
    "hex": "#cd5c5c",
    "rgb": [205, 92, 92],
  },
  "china_pink": {
    "name": "China Pink",
    "hex": "#de6fa1",
    "rgb": [222, 111, 161],
  },
  "china_rose": {
    "name": "China Rose",
    "hex": "#a8516e",
    "rgb": [168, 81, 110],
  },
  "chinese_red": {
    "name": "Chinese Red",
    "hex": "#aa381e",
    "rgb": [170, 56, 30],
  },
  "chocolate_traditional": {
    "name": "Chocolate (Traditional)",
    "hex": "#7b3f00",
    "rgb": [123, 63, 0],
  },
  "chocolate_web": {
    "name": "Chocolate (Web)",
    "hex": "#d2691e",
    "rgb": [210, 105, 30],
  },
  "chrome_yellow": {
    "name": "Chrome Yellow",
    "hex": "#ffa700",
    "rgb": [255, 167, 0],
  },
  "cinereous": {
    "name": "Cinereous",
    "hex": "#98817b",
    "rgb": [152, 129, 123],
  },
  "cinnabar": {
    "name": "Cinnabar",
    "hex": "#e34234",
    "rgb": [227, 66, 52],
  },
  "cinnamon": {
    "name": "Cinnamon",
    "hex": "#d2691e",
    "rgb": [210, 105, 30],
  },
  "citrine": {
    "name": "Citrine",
    "hex": "#e4d00a",
    "rgb": [228, 208, 10],
  },
  "classic_rose": {
    "name": "Classic Rose",
    "hex": "#fbcce7",
    "rgb": [251, 204, 231],
  },
  "cobalt": {
    "name": "Cobalt",
    "hex": "#0047ab",
    "rgb": [0, 71, 171],
  },
  "cocoa_brown": {
    "name": "Cocoa Brown",
    "hex": "#d2691e",
    "rgb": [210, 105, 30],
  },
  "coffee": {
    "name": "Coffee",
    "hex": "#6f4e37",
    "rgb": [111, 78, 55],
  },
  "columbia_blue": {
    "name": "Columbia Blue",
    "hex": "#9bddff",
    "rgb": [155, 221, 255],
  },
  "congo_pink": {
    "name": "Congo Pink",
    "hex": "#f88379",
    "rgb": [248, 131, 121],
  },
  "cool_black": {
    "name": "Cool Black",
    "hex": "#002e63",
    "rgb": [0, 46, 99],
  },
  "cool_grey": {
    "name": "Cool Grey",
    "hex": "#8c92ac",
    "rgb": [140, 146, 172],
  },
  "copper": {
    "name": "Copper",
    "hex": "#b87333",
    "rgb": [184, 115, 51],
  },
  "copper_crayola": {
    "name": "Copper (Crayola)",
    "hex": "#da8a67",
    "rgb": [218, 138, 103],
  },
  "copper_penny": {
    "name": "Copper Penny",
    "hex": "#ad6f69",
    "rgb": [173, 111, 105],
  },
  "copper_red": {
    "name": "Copper Red",
    "hex": "#cb6d51",
    "rgb": [203, 109, 81],
  },
  "copper_rose": {
    "name": "Copper Rose",
    "hex": "#966",
    "rgb": [153, 102, 102],
  },
  "coquelicot": {
    "name": "Coquelicot",
    "hex": "#ff3800",
    "rgb": [255, 56, 0],
  },
  "coral": {
    "name": "Coral",
    "hex": "#ff7f50",
    "rgb": [255, 127, 80],
  },
  "coral_pink": {
    "name": "Coral Pink",
    "hex": "#f88379",
    "rgb": [248, 131, 121],
  },
  "coral_red": {
    "name": "Coral Red",
    "hex": "#ff4040",
    "rgb": [255, 64, 64],
  },
  "cordovan": {
    "name": "Cordovan",
    "hex": "#893f45",
    "rgb": [137, 63, 69],
  },
  "corn": {
    "name": "Corn",
    "hex": "#fbec5d",
    "rgb": [251, 236, 93],
  },
  "cornell_red": {
    "name": "Cornell Red",
    "hex": "#b31b1b",
    "rgb": [179, 27, 27],
  },
  "cornflower_blue": {
    "name": "Cornflower Blue",
    "hex": "#6495ed",
    "rgb": [100, 149, 237],
  },
  "cornsilk": {
    "name": "Cornsilk",
    "hex": "#fff8dc",
    "rgb": [255, 248, 220],
  },
  "cosmic_latte": {
    "name": "Cosmic Latte",
    "hex": "#fff8e7",
    "rgb": [255, 248, 231],
  },
  "cotton_candy": {
    "name": "Cotton Candy",
    "hex": "#ffbcd9",
    "rgb": [255, 188, 217],
  },
  "cream": {
    "name": "Cream",
    "hex": "#fffdd0",
    "rgb": [255, 253, 208],
  },
  "crimson": {
    "name": "Crimson",
    "hex": "#dc143c",
    "rgb": [220, 20, 60],
  },
  "crimson_glory": {
    "name": "Crimson Glory",
    "hex": "#be0032",
    "rgb": [190, 0, 50],
  },
  "cyan": {
    "name": "Cyan",
    "hex": "#0ff",
    "rgb": [0, 255, 255],
  },
  "cyan_process": {
    "name": "Cyan (Process)",
    "hex": "#00b7eb",
    "rgb": [0, 183, 235],
  },
  "daffodil": {
    "name": "Daffodil",
    "hex": "#ffff31",
    "rgb": [255, 255, 49],
  },
  "dandelion": {
    "name": "Dandelion",
    "hex": "#f0e130",
    "rgb": [240, 225, 48],
  },
  "dark_blue": {
    "name": "Dark Blue",
    "hex": "#00008b",
    "rgb": [0, 0, 139],
  },
  "dark_brown": {
    "name": "Dark Brown",
    "hex": "#654321",
    "rgb": [101, 67, 33],
  },
  "dark_byzantium": {
    "name": "Dark Byzantium",
    "hex": "#5d3954",
    "rgb": [93, 57, 84],
  },
  "dark_candy_apple_red": {
    "name": "Dark Candy Apple Red",
    "hex": "#a40000",
    "rgb": [164, 0, 0],
  },
  "dark_cerulean": {
    "name": "Dark Cerulean",
    "hex": "#08457e",
    "rgb": [8, 69, 126],
  },
  "dark_chestnut": {
    "name": "Dark Chestnut",
    "hex": "#986960",
    "rgb": [152, 105, 96],
  },
  "dark_coral": {
    "name": "Dark Coral",
    "hex": "#cd5b45",
    "rgb": [205, 91, 69],
  },
  "dark_cyan": {
    "name": "Dark Cyan",
    "hex": "#008b8b",
    "rgb": [0, 139, 139],
  },
  "dark_electric_blue": {
    "name": "Dark Electric Blue",
    "hex": "#536878",
    "rgb": [83, 104, 120],
  },
  "dark_goldenrod": {
    "name": "Dark Goldenrod",
    "hex": "#b8860b",
    "rgb": [184, 134, 11],
  },
  "dark_gray": {
    "name": "Dark Gray",
    "hex": "#a9a9a9",
    "rgb": [169, 169, 169],
  },
  "dark_green": {
    "name": "Dark Green",
    "hex": "#013220",
    "rgb": [1, 50, 32],
  },
  "dark_imperial_blue": {
    "name": "Dark Imperial Blue",
    "hex": "#00416a",
    "rgb": [0, 65, 106],
  },
  "dark_jungle_green": {
    "name": "Dark Jungle Green",
    "hex": "#1a2421",
    "rgb": [26, 36, 33],
  },
  "dark_khaki": {
    "name": "Dark Khaki",
    "hex": "#bdb76b",
    "rgb": [189, 183, 107],
  },
  "dark_lava": {
    "name": "Dark Lava",
    "hex": "#483c32",
    "rgb": [72, 60, 50],
  },
  "dark_lavender": {
    "name": "Dark Lavender",
    "hex": "#734f96",
    "rgb": [115, 79, 150],
  },
  "dark_magenta": {
    "name": "Dark Magenta",
    "hex": "#8b008b",
    "rgb": [139, 0, 139],
  },
  "dark_midnight_blue": {
    "name": "Dark Midnight Blue",
    "hex": "#036",
    "rgb": [0, 51, 102],
  },
  "dark_olive_green": {
    "name": "Dark Olive Green",
    "hex": "#556b2f",
    "rgb": [85, 107, 47],
  },
  "dark_orange": {
    "name": "Dark Orange",
    "hex": "#ff8c00",
    "rgb": [255, 140, 0],
  },
  "dark_orchid": {
    "name": "Dark Orchid",
    "hex": "#9932cc",
    "rgb": [153, 50, 204],
  },
  "dark_pastel_blue": {
    "name": "Dark Pastel Blue",
    "hex": "#779ecb",
    "rgb": [119, 158, 203],
  },
  "dark_pastel_green": {
    "name": "Dark Pastel Green",
    "hex": "#03c03c",
    "rgb": [3, 192, 60],
  },
  "dark_pastel_purple": {
    "name": "Dark Pastel Purple",
    "hex": "#966fd6",
    "rgb": [150, 111, 214],
  },
  "dark_pastel_red": {
    "name": "Dark Pastel Red",
    "hex": "#c23b22",
    "rgb": [194, 59, 34],
  },
  "dark_pink": {
    "name": "Dark Pink",
    "hex": "#e75480",
    "rgb": [231, 84, 128],
  },
  "dark_powder_blue": {
    "name": "Dark Powder Blue",
    "hex": "#039",
    "rgb": [0, 51, 153],
  },
  "dark_raspberry": {
    "name": "Dark Raspberry",
    "hex": "#872657",
    "rgb": [135, 38, 87],
  },
  "dark_red": {
    "name": "Dark Red",
    "hex": "#8b0000",
    "rgb": [139, 0, 0],
  },
  "dark_salmon": {
    "name": "Dark Salmon",
    "hex": "#e9967a",
    "rgb": [233, 150, 122],
  },
  "dark_scarlet": {
    "name": "Dark Scarlet",
    "hex": "#560319",
    "rgb": [86, 3, 25],
  },
  "dark_sea_green": {
    "name": "Dark Sea Green",
    "hex": "#8fbc8f",
    "rgb": [143, 188, 143],
  },
  "dark_sienna": {
    "name": "Dark Sienna",
    "hex": "#3c1414",
    "rgb": [60, 20, 20],
  },
  "dark_slate_blue": {
    "name": "Dark Slate Blue",
    "hex": "#483d8b",
    "rgb": [72, 61, 139],
  },
  "dark_slate_gray": {
    "name": "Dark Slate Gray",
    "hex": "#2f4f4f",
    "rgb": [47, 79, 79],
  },
  "dark_spring_green": {
    "name": "Dark Spring Green",
    "hex": "#177245",
    "rgb": [23, 114, 69],
  },
  "dark_tan": {
    "name": "Dark Tan",
    "hex": "#918151",
    "rgb": [145, 129, 81],
  },
  "dark_tangerine": {
    "name": "Dark Tangerine",
    "hex": "#ffa812",
    "rgb": [255, 168, 18],
  },
  "dark_taupe": {
    "name": "Dark Taupe",
    "hex": "#483c32",
    "rgb": [72, 60, 50],
  },
  "dark_terra_cotta": {
    "name": "Dark Terra Cotta",
    "hex": "#cc4e5c",
    "rgb": [204, 78, 92],
  },
  "dark_turquoise": {
    "name": "Dark Turquoise",
    "hex": "#00ced1",
    "rgb": [0, 206, 209],
  },
  "dark_violet": {
    "name": "Dark Violet",
    "hex": "#9400d3",
    "rgb": [148, 0, 211],
  },
  "dark_yellow": {
    "name": "Dark Yellow",
    "hex": "#9b870c",
    "rgb": [155, 135, 12],
  },
  "dartmouth_green": {
    "name": "Dartmouth Green",
    "hex": "#00703c",
    "rgb": [0, 112, 60],
  },
  "davy_s_grey": {
    "name": "Davy'S Grey",
    "hex": "#555",
    "rgb": [85, 85, 85],
  },
  "debian_red": {
    "name": "Debian Red",
    "hex": "#d70a53",
    "rgb": [215, 10, 83],
  },
  "deep_carmine": {
    "name": "Deep Carmine",
    "hex": "#a9203e",
    "rgb": [169, 32, 62],
  },
  "deep_carmine_pink": {
    "name": "Deep Carmine Pink",
    "hex": "#ef3038",
    "rgb": [239, 48, 56],
  },
  "deep_carrot_orange": {
    "name": "Deep Carrot Orange",
    "hex": "#e9692c",
    "rgb": [233, 105, 44],
  },
  "deep_cerise": {
    "name": "Deep Cerise",
    "hex": "#da3287",
    "rgb": [218, 50, 135],
  },
  "deep_champagne": {
    "name": "Deep Champagne",
    "hex": "#fad6a5",
    "rgb": [250, 214, 165],
  },
  "deep_chestnut": {
    "name": "Deep Chestnut",
    "hex": "#b94e48",
    "rgb": [185, 78, 72],
  },
  "deep_coffee": {
    "name": "Deep Coffee",
    "hex": "#704241",
    "rgb": [112, 66, 65],
  },
  "deep_fuchsia": {
    "name": "Deep Fuchsia",
    "hex": "#c154c1",
    "rgb": [193, 84, 193],
  },
  "deep_jungle_green": {
    "name": "Deep Jungle Green",
    "hex": "#004b49",
    "rgb": [0, 75, 73],
  },
  "deep_lilac": {
    "name": "Deep Lilac",
    "hex": "#95b",
    "rgb": [153, 85, 187],
  },
  "deep_magenta": {
    "name": "Deep Magenta",
    "hex": "#c0c",
    "rgb": [204, 0, 204],
  },
  "deep_peach": {
    "name": "Deep Peach",
    "hex": "#ffcba4",
    "rgb": [255, 203, 164],
  },
  "deep_pink": {
    "name": "Deep Pink",
    "hex": "#ff1493",
    "rgb": [255, 20, 147],
  },
  "deep_ruby": {
    "name": "Deep Ruby",
    "hex": "#843f5b",
    "rgb": [132, 63, 91],
  },
  "deep_saffron": {
    "name": "Deep Saffron",
    "hex": "#f93",
    "rgb": [255, 153, 51],
  },
  "deep_sky_blue": {
    "name": "Deep Sky Blue",
    "hex": "#00bfff",
    "rgb": [0, 191, 255],
  },
  "deep_tuscan_red": {
    "name": "Deep Tuscan Red",
    "hex": "#66424d",
    "rgb": [102, 66, 77],
  },
  "denim": {
    "name": "Denim",
    "hex": "#1560bd",
    "rgb": [21, 96, 189],
  },
  "desert": {
    "name": "Desert",
    "hex": "#c19a6b",
    "rgb": [193, 154, 107],
  },
  "desert_sand": {
    "name": "Desert Sand",
    "hex": "#edc9af",
    "rgb": [237, 201, 175],
  },
  "dim_gray": {
    "name": "Dim Gray",
    "hex": "#696969",
    "rgb": [105, 105, 105],
  },
  "dodger_blue": {
    "name": "Dodger Blue",
    "hex": "#1e90ff",
    "rgb": [30, 144, 255],
  },
  "dogwood_rose": {
    "name": "Dogwood Rose",
    "hex": "#d71868",
    "rgb": [215, 24, 104],
  },
  "dollar_bill": {
    "name": "Dollar Bill",
    "hex": "#85bb65",
    "rgb": [133, 187, 101],
  },
  "drab": {
    "name": "Drab",
    "hex": "#967117",
    "rgb": [150, 113, 23],
  },
  "duke_blue": {
    "name": "Duke Blue",
    "hex": "#00009c",
    "rgb": [0, 0, 156],
  },
  "earth_yellow": {
    "name": "Earth Yellow",
    "hex": "#e1a95f",
    "rgb": [225, 169, 95],
  },
  "ebony": {
    "name": "Ebony",
    "hex": "#555d50",
    "rgb": [85, 93, 80],
  },
  "ecru": {
    "name": "Ecru",
    "hex": "#c2b280",
    "rgb": [194, 178, 128],
  },
  "eggplant": {
    "name": "Eggplant",
    "hex": "#614051",
    "rgb": [97, 64, 81],
  },
  "eggshell": {
    "name": "Eggshell",
    "hex": "#f0ead6",
    "rgb": [240, 234, 214],
  },
  "egyptian_blue": {
    "name": "Egyptian Blue",
    "hex": "#1034a6",
    "rgb": [16, 52, 166],
  },
  "electric_blue": {
    "name": "Electric Blue",
    "hex": "#7df9ff",
    "rgb": [125, 249, 255],
  },
  "electric_crimson": {
    "name": "Electric Crimson",
    "hex": "#ff003f",
    "rgb": [255, 0, 63],
  },
  "electric_cyan": {
    "name": "Electric Cyan",
    "hex": "#0ff",
    "rgb": [0, 255, 255],
  },
  "electric_green": {
    "name": "Electric Green",
    "hex": "#0f0",
    "rgb": [0, 255, 0],
  },
  "electric_indigo": {
    "name": "Electric Indigo",
    "hex": "#6f00ff",
    "rgb": [111, 0, 255],
  },
  "electric_lavender": {
    "name": "Electric Lavender",
    "hex": "#f4bbff",
    "rgb": [244, 187, 255],
  },
  "electric_lime": {
    "name": "Electric Lime",
    "hex": "#cf0",
    "rgb": [204, 255, 0],
  },
  "electric_purple": {
    "name": "Electric Purple",
    "hex": "#bf00ff",
    "rgb": [191, 0, 255],
  },
  "electric_ultramarine": {
    "name": "Electric Ultramarine",
    "hex": "#3f00ff",
    "rgb": [63, 0, 255],
  },
  "electric_violet": {
    "name": "Electric Violet",
    "hex": "#8f00ff",
    "rgb": [143, 0, 255],
  },
  "electric_yellow": {
    "name": "Electric Yellow",
    "hex": "#ff0",
    "rgb": [255, 255, 0],
  },
  "emerald": {
    "name": "Emerald",
    "hex": "#50c878",
    "rgb": [80, 200, 120],
  },
  "english_lavender": {
    "name": "English Lavender",
    "hex": "#b48395",
    "rgb": [180, 131, 149],
  },
  "eton_blue": {
    "name": "Eton Blue",
    "hex": "#96c8a2",
    "rgb": [150, 200, 162],
  },
  "fallow": {
    "name": "Fallow",
    "hex": "#c19a6b",
    "rgb": [193, 154, 107],
  },
  "falu_red": {
    "name": "Falu Red",
    "hex": "#801818",
    "rgb": [128, 24, 24],
  },
  "fandango": {
    "name": "Fandango",
    "hex": "#b53389",
    "rgb": [181, 51, 137],
  },
  "fashion_fuchsia": {
    "name": "Fashion Fuchsia",
    "hex": "#f400a1",
    "rgb": [244, 0, 161],
  },
  "fawn": {
    "name": "Fawn",
    "hex": "#e5aa70",
    "rgb": [229, 170, 112],
  },
  "feldgrau": {
    "name": "Feldgrau",
    "hex": "#4d5d53",
    "rgb": [77, 93, 83],
  },
  "fern_green": {
    "name": "Fern Green",
    "hex": "#4f7942",
    "rgb": [79, 121, 66],
  },
  "ferrari_red": {
    "name": "Ferrari Red",
    "hex": "#ff2800",
    "rgb": [255, 40, 0],
  },
  "field_drab": {
    "name": "Field Drab",
    "hex": "#6c541e",
    "rgb": [108, 84, 30],
  },
  "fire_engine_red": {
    "name": "Fire Engine Red",
    "hex": "#ce2029",
    "rgb": [206, 32, 41],
  },
  "firebrick": {
    "name": "Firebrick",
    "hex": "#b22222",
    "rgb": [178, 34, 34],
  },
  "flame": {
    "name": "Flame",
    "hex": "#e25822",
    "rgb": [226, 88, 34],
  },
  "flamingo_pink": {
    "name": "Flamingo Pink",
    "hex": "#fc8eac",
    "rgb": [252, 142, 172],
  },
  "flavescent": {
    "name": "Flavescent",
    "hex": "#f7e98e",
    "rgb": [247, 233, 142],
  },
  "flax": {
    "name": "Flax",
    "hex": "#eedc82",
    "rgb": [238, 220, 130],
  },
  "floral_white": {
    "name": "Floral White",
    "hex": "#fffaf0",
    "rgb": [255, 250, 240],
  },
  "fluorescent_orange": {
    "name": "Fluorescent Orange",
    "hex": "#ffbf00",
    "rgb": [255, 191, 0],
  },
  "fluorescent_pink": {
    "name": "Fluorescent Pink",
    "hex": "#ff1493",
    "rgb": [255, 20, 147],
  },
  "fluorescent_yellow": {
    "name": "Fluorescent Yellow",
    "hex": "#cf0",
    "rgb": [204, 255, 0],
  },
  "folly": {
    "name": "Folly",
    "hex": "#ff004f",
    "rgb": [255, 0, 79],
  },
  "forest_green_traditional": {
    "name": "Forest Green (Traditional)",
    "hex": "#014421",
    "rgb": [1, 68, 33],
  },
  "forest_green_web": {
    "name": "Forest Green (Web)",
    "hex": "#228b22",
    "rgb": [34, 139, 34],
  },
  "french_beige": {
    "name": "French Beige",
    "hex": "#a67b5b",
    "rgb": [166, 123, 91],
  },
  "french_blue": {
    "name": "French Blue",
    "hex": "#0072bb",
    "rgb": [0, 114, 187],
  },
  "french_lilac": {
    "name": "French Lilac",
    "hex": "#86608e",
    "rgb": [134, 96, 142],
  },
  "french_lime": {
    "name": "French Lime",
    "hex": "#cf0",
    "rgb": [204, 255, 0],
  },
  "french_raspberry": {
    "name": "French Raspberry",
    "hex": "#c72c48",
    "rgb": [199, 44, 72],
  },
  "french_rose": {
    "name": "French Rose",
    "hex": "#f64a8a",
    "rgb": [246, 74, 138],
  },
  "fuchsia": {
    "name": "Fuchsia",
    "hex": "#f0f",
    "rgb": [255, 0, 255],
  },
  "fuchsia_crayola": {
    "name": "Fuchsia (Crayola)",
    "hex": "#c154c1",
    "rgb": [193, 84, 193],
  },
  "fuchsia_pink": {
    "name": "Fuchsia Pink",
    "hex": "#f7f",
    "rgb": [255, 119, 255],
  },
  "fuchsia_rose": {
    "name": "Fuchsia Rose",
    "hex": "#c74375",
    "rgb": [199, 67, 117],
  },
  "fulvous": {
    "name": "Fulvous",
    "hex": "#e48400",
    "rgb": [228, 132, 0],
  },
  "fuzzy_wuzzy": {
    "name": "Fuzzy Wuzzy",
    "hex": "#c66",
    "rgb": [204, 102, 102],
  },
  "gainsboro": {
    "name": "Gainsboro",
    "hex": "#dcdcdc",
    "rgb": [220, 220, 220],
  },
  "gamboge": {
    "name": "Gamboge",
    "hex": "#e49b0f",
    "rgb": [228, 155, 15],
  },
  "ghost_white": {
    "name": "Ghost White",
    "hex": "#f8f8ff",
    "rgb": [248, 248, 255],
  },
  "ginger": {
    "name": "Ginger",
    "hex": "#b06500",
    "rgb": [176, 101, 0],
  },
  "glaucous": {
    "name": "Glaucous",
    "hex": "#6082b6",
    "rgb": [96, 130, 182],
  },
  "glitter": {
    "name": "Glitter",
    "hex": "#e6e8fa",
    "rgb": [230, 232, 250],
  },
  "gold_metallic": {
    "name": "Gold (Metallic)",
    "hex": "#d4af37",
    "rgb": [212, 175, 55],
  },
  "gold_web_golden": {
    "name": "Gold (Web) (Golden)",
    "hex": "#ffd700",
    "rgb": [255, 215, 0],
  },
  "golden_brown": {
    "name": "Golden Brown",
    "hex": "#996515",
    "rgb": [153, 101, 21],
  },
  "golden_poppy": {
    "name": "Golden Poppy",
    "hex": "#fcc200",
    "rgb": [252, 194, 0],
  },
  "golden_yellow": {
    "name": "Golden Yellow",
    "hex": "#ffdf00",
    "rgb": [255, 223, 0],
  },
  "goldenrod": {
    "name": "Goldenrod",
    "hex": "#daa520",
    "rgb": [218, 165, 32],
  },
  "granny_smith_apple": {
    "name": "Granny Smith Apple",
    "hex": "#a8e4a0",
    "rgb": [168, 228, 160],
  },
  "gray": {
    "name": "Gray",
    "hex": "#808080",
    "rgb": [128, 128, 128],
  },
  "gray_asparagus": {
    "name": "Gray-Asparagus",
    "hex": "#465945",
    "rgb": [70, 89, 69],
  },
  "gray_html_css_gray": {
    "name": "Gray (Html/Css Gray)",
    "hex": "#808080",
    "rgb": [128, 128, 128],
  },
  "gray_x11_gray": {
    "name": "Gray (X11 Gray)",
    "hex": "#bebebe",
    "rgb": [190, 190, 190],
  },
  "green_color_wheel_x11_green": {
    "name": "Green (Color Wheel) (X11 Green)",
    "hex": "#0f0",
    "rgb": [0, 255, 0],
  },
  "green_crayola": {
    "name": "Green (Crayola)",
    "hex": "#1cac78",
    "rgb": [28, 172, 120],
  },
  "green_html_css_green": {
    "name": "Green (Html/Css Green)",
    "hex": "#008000",
    "rgb": [0, 128, 0],
  },
  "green_munsell": {
    "name": "Green (Munsell)",
    "hex": "#00a877",
    "rgb": [0, 168, 119],
  },
  "green_ncs": {
    "name": "Green (Ncs)",
    "hex": "#009f6b",
    "rgb": [0, 159, 107],
  },
  "green_pigment": {
    "name": "Green (Pigment)",
    "hex": "#00a550",
    "rgb": [0, 165, 80],
  },
  "green_ryb": {
    "name": "Green (Ryb)",
    "hex": "#66b032",
    "rgb": [102, 176, 50],
  },
  "green_yellow": {
    "name": "Green-Yellow",
    "hex": "#adff2f",
    "rgb": [173, 255, 47],
  },
  "grullo": {
    "name": "Grullo",
    "hex": "#a99a86",
    "rgb": [169, 154, 134],
  },
  "guppie_green": {
    "name": "Guppie Green",
    "hex": "#00ff7f",
    "rgb": [0, 255, 127],
  },
  "halay_be": {
    "name": "Halayà úBe",
    "hex": "#663854",
    "rgb": [102, 56, 84],
  },
  "han_blue": {
    "name": "Han Blue",
    "hex": "#446ccf",
    "rgb": [68, 108, 207],
  },
  "han_purple": {
    "name": "Han Purple",
    "hex": "#5218fa",
    "rgb": [82, 24, 250],
  },
  "hansa_yellow": {
    "name": "Hansa Yellow",
    "hex": "#e9d66b",
    "rgb": [233, 214, 107],
  },
  "harlequin": {
    "name": "Harlequin",
    "hex": "#3fff00",
    "rgb": [63, 255, 0],
  },
  "harvard_crimson": {
    "name": "Harvard Crimson",
    "hex": "#c90016",
    "rgb": [201, 0, 22],
  },
  "harvest_gold": {
    "name": "Harvest Gold",
    "hex": "#da9100",
    "rgb": [218, 145, 0],
  },
  "heart_gold": {
    "name": "Heart Gold",
    "hex": "#808000",
    "rgb": [128, 128, 0],
  },
  "heliotrope": {
    "name": "Heliotrope",
    "hex": "#df73ff",
    "rgb": [223, 115, 255],
  },
  "hollywood_cerise": {
    "name": "Hollywood Cerise",
    "hex": "#f400a1",
    "rgb": [244, 0, 161],
  },
  "honeydew": {
    "name": "Honeydew",
    "hex": "#f0fff0",
    "rgb": [240, 255, 240],
  },
  "honolulu_blue": {
    "name": "Honolulu Blue",
    "hex": "#007fbf",
    "rgb": [0, 127, 191],
  },
  "hooker_s_green": {
    "name": "Hooker'S Green",
    "hex": "#49796b",
    "rgb": [73, 121, 107],
  },
  "hot_magenta": {
    "name": "Hot Magenta",
    "hex": "#ff1dce",
    "rgb": [255, 29, 206],
  },
  "hot_pink": {
    "name": "Hot Pink",
    "hex": "#ff69b4",
    "rgb": [255, 105, 180],
  },
  "hunter_green": {
    "name": "Hunter Green",
    "hex": "#355e3b",
    "rgb": [53, 94, 59],
  },
  "iceberg": {
    "name": "Iceberg",
    "hex": "#71a6d2",
    "rgb": [113, 166, 210],
  },
  "icterine": {
    "name": "Icterine",
    "hex": "#fcf75e",
    "rgb": [252, 247, 94],
  },
  "imperial_blue": {
    "name": "Imperial Blue",
    "hex": "#002395",
    "rgb": [0, 35, 149],
  },
  "inchworm": {
    "name": "Inchworm",
    "hex": "#b2ec5d",
    "rgb": [178, 236, 93],
  },
  "india_green": {
    "name": "India Green",
    "hex": "#138808",
    "rgb": [19, 136, 8],
  },
  "indian_red": {
    "name": "Indian Red",
    "hex": "#cd5c5c",
    "rgb": [205, 92, 92],
  },
  "indian_yellow": {
    "name": "Indian Yellow",
    "hex": "#e3a857",
    "rgb": [227, 168, 87],
  },
  "indigo": {
    "name": "Indigo",
    "hex": "#6f00ff",
    "rgb": [111, 0, 255],
  },
  "indigo_dye": {
    "name": "Indigo (Dye)",
    "hex": "#00416a",
    "rgb": [0, 65, 106],
  },
  "indigo_web": {
    "name": "Indigo (Web)",
    "hex": "#4b0082",
    "rgb": [75, 0, 130],
  },
  "international_klein_blue": {
    "name": "International Klein Blue",
    "hex": "#002fa7",
    "rgb": [0, 47, 167],
  },
  "international_orange_aerospace": {
    "name": "International Orange (Aerospace)",
    "hex": "#ff4f00",
    "rgb": [255, 79, 0],
  },
  "international_orange_engineering": {
    "name": "International Orange (Engineering)",
    "hex": "#ba160c",
    "rgb": [186, 22, 12],
  },
  "international_orange_golden_gate_bridge": {
    "name": "International Orange (Golden Gate Bridge)",
    "hex": "#c0362c",
    "rgb": [192, 54, 44],
  },
  "iris": {
    "name": "Iris",
    "hex": "#5a4fcf",
    "rgb": [90, 79, 207],
  },
  "isabelline": {
    "name": "Isabelline",
    "hex": "#f4f0ec",
    "rgb": [244, 240, 236],
  },
  "islamic_green": {
    "name": "Islamic Green",
    "hex": "#009000",
    "rgb": [0, 144, 0],
  },
  "ivory": {
    "name": "Ivory",
    "hex": "#fffff0",
    "rgb": [255, 255, 240],
  },
  "jade": {
    "name": "Jade",
    "hex": "#00a86b",
    "rgb": [0, 168, 107],
  },
  "jasmine": {
    "name": "Jasmine",
    "hex": "#f8de7e",
    "rgb": [248, 222, 126],
  },
  "jasper": {
    "name": "Jasper",
    "hex": "#d73b3e",
    "rgb": [215, 59, 62],
  },
  "jazzberry_jam": {
    "name": "Jazzberry Jam",
    "hex": "#a50b5e",
    "rgb": [165, 11, 94],
  },
  "jet": {
    "name": "Jet",
    "hex": "#343434",
    "rgb": [52, 52, 52],
  },
  "jonquil": {
    "name": "Jonquil",
    "hex": "#fada5e",
    "rgb": [250, 218, 94],
  },
  "june_bud": {
    "name": "June Bud",
    "hex": "#bdda57",
    "rgb": [189, 218, 87],
  },
  "jungle_green": {
    "name": "Jungle Green",
    "hex": "#29ab87",
    "rgb": [41, 171, 135],
  },
  "kelly_green": {
    "name": "Kelly Green",
    "hex": "#4cbb17",
    "rgb": [76, 187, 23],
  },
  "kenyan_copper": {
    "name": "Kenyan Copper",
    "hex": "#7c1c05",
    "rgb": [124, 28, 5],
  },
  "khaki_html_css_khaki": {
    "name": "Khaki (Html/Css) (Khaki)",
    "hex": "#c3b091",
    "rgb": [195, 176, 145],
  },
  "khaki_x11_light_khaki": {
    "name": "Khaki (X11) (Light Khaki)",
    "hex": "#f0e68c",
    "rgb": [240, 230, 140],
  },
  "ku_crimson": {
    "name": "Ku Crimson",
    "hex": "#e8000d",
    "rgb": [232, 0, 13],
  },
  "la_salle_green": {
    "name": "La Salle Green",
    "hex": "#087830",
    "rgb": [8, 120, 48],
  },
  "languid_lavender": {
    "name": "Languid Lavender",
    "hex": "#d6cadd",
    "rgb": [214, 202, 221],
  },
  "lapis_lazuli": {
    "name": "Lapis Lazuli",
    "hex": "#26619c",
    "rgb": [38, 97, 156],
  },
  "laser_lemon": {
    "name": "Laser Lemon",
    "hex": "#fefe22",
    "rgb": [254, 254, 34],
  },
  "laurel_green": {
    "name": "Laurel Green",
    "hex": "#a9ba9d",
    "rgb": [169, 186, 157],
  },
  "lava": {
    "name": "Lava",
    "hex": "#cf1020",
    "rgb": [207, 16, 32],
  },
  "lavender_blue": {
    "name": "Lavender Blue",
    "hex": "#ccf",
    "rgb": [204, 204, 255],
  },
  "lavender_blush": {
    "name": "Lavender Blush",
    "hex": "#fff0f5",
    "rgb": [255, 240, 245],
  },
  "lavender_floral": {
    "name": "Lavender (Floral)",
    "hex": "#b57edc",
    "rgb": [181, 126, 220],
  },
  "lavender_gray": {
    "name": "Lavender Gray",
    "hex": "#c4c3d0",
    "rgb": [196, 195, 208],
  },
  "lavender_indigo": {
    "name": "Lavender Indigo",
    "hex": "#9457eb",
    "rgb": [148, 87, 235],
  },
  "lavender_magenta": {
    "name": "Lavender Magenta",
    "hex": "#ee82ee",
    "rgb": [238, 130, 238],
  },
  "lavender_mist": {
    "name": "Lavender Mist",
    "hex": "#e6e6fa",
    "rgb": [230, 230, 250],
  },
  "lavender_pink": {
    "name": "Lavender Pink",
    "hex": "#fbaed2",
    "rgb": [251, 174, 210],
  },
  "lavender_purple": {
    "name": "Lavender Purple",
    "hex": "#967bb6",
    "rgb": [150, 123, 182],
  },
  "lavender_rose": {
    "name": "Lavender Rose",
    "hex": "#fba0e3",
    "rgb": [251, 160, 227],
  },
  "lavender_web": {
    "name": "Lavender (Web)",
    "hex": "#e6e6fa",
    "rgb": [230, 230, 250],
  },
  "lawn_green": {
    "name": "Lawn Green",
    "hex": "#7cfc00",
    "rgb": [124, 252, 0],
  },
  "lemon": {
    "name": "Lemon",
    "hex": "#fff700",
    "rgb": [255, 247, 0],
  },
  "lemon_chiffon": {
    "name": "Lemon Chiffon",
    "hex": "#fffacd",
    "rgb": [255, 250, 205],
  },
  "lemon_lime": {
    "name": "Lemon Lime",
    "hex": "#e3ff00",
    "rgb": [227, 255, 0],
  },
  "licorice": {
    "name": "Licorice",
    "hex": "#1a1110",
    "rgb": [26, 17, 16],
  },
  "light_apricot": {
    "name": "Light Apricot",
    "hex": "#fdd5b1",
    "rgb": [253, 213, 177],
  },
  "light_blue": {
    "name": "Light Blue",
    "hex": "#add8e6",
    "rgb": [173, 216, 230],
  },
  "light_brown": {
    "name": "Light Brown",
    "hex": "#b5651d",
    "rgb": [181, 101, 29],
  },
  "light_carmine_pink": {
    "name": "Light Carmine Pink",
    "hex": "#e66771",
    "rgb": [230, 103, 113],
  },
  "light_coral": {
    "name": "Light Coral",
    "hex": "#f08080",
    "rgb": [240, 128, 128],
  },
  "light_cornflower_blue": {
    "name": "Light Cornflower Blue",
    "hex": "#93ccea",
    "rgb": [147, 204, 234],
  },
  "light_crimson": {
    "name": "Light Crimson",
    "hex": "#f56991",
    "rgb": [245, 105, 145],
  },
  "light_cyan": {
    "name": "Light Cyan",
    "hex": "#e0ffff",
    "rgb": [224, 255, 255],
  },
  "light_fuchsia_pink": {
    "name": "Light Fuchsia Pink",
    "hex": "#f984ef",
    "rgb": [249, 132, 239],
  },
  "light_goldenrod_yellow": {
    "name": "Light Goldenrod Yellow",
    "hex": "#fafad2",
    "rgb": [250, 250, 210],
  },
  "light_gray": {
    "name": "Light Gray",
    "hex": "#d3d3d3",
    "rgb": [211, 211, 211],
  },
  "light_green": {
    "name": "Light Green",
    "hex": "#90ee90",
    "rgb": [144, 238, 144],
  },
  "light_khaki": {
    "name": "Light Khaki",
    "hex": "#f0e68c",
    "rgb": [240, 230, 140],
  },
  "light_pastel_purple": {
    "name": "Light Pastel Purple",
    "hex": "#b19cd9",
    "rgb": [177, 156, 217],
  },
  "light_pink": {
    "name": "Light Pink",
    "hex": "#ffb6c1",
    "rgb": [255, 182, 193],
  },
  "light_red_ochre": {
    "name": "Light Red Ochre",
    "hex": "#e97451",
    "rgb": [233, 116, 81],
  },
  "light_salmon": {
    "name": "Light Salmon",
    "hex": "#ffa07a",
    "rgb": [255, 160, 122],
  },
  "light_salmon_pink": {
    "name": "Light Salmon Pink",
    "hex": "#f99",
    "rgb": [255, 153, 153],
  },
  "light_sea_green": {
    "name": "Light Sea Green",
    "hex": "#20b2aa",
    "rgb": [32, 178, 170],
  },
  "light_sky_blue": {
    "name": "Light Sky Blue",
    "hex": "#87cefa",
    "rgb": [135, 206, 250],
  },
  "light_slate_gray": {
    "name": "Light Slate Gray",
    "hex": "#789",
    "rgb": [119, 136, 153],
  },
  "light_taupe": {
    "name": "Light Taupe",
    "hex": "#b38b6d",
    "rgb": [179, 139, 109],
  },
  "light_thulian_pink": {
    "name": "Light Thulian Pink",
    "hex": "#e68fac",
    "rgb": [230, 143, 172],
  },
  "light_yellow": {
    "name": "Light Yellow",
    "hex": "#ffffe0",
    "rgb": [255, 255, 224],
  },
  "lilac": {
    "name": "Lilac",
    "hex": "#c8a2c8",
    "rgb": [200, 162, 200],
  },
  "lime_color_wheel": {
    "name": "Lime (Color Wheel)",
    "hex": "#bfff00",
    "rgb": [191, 255, 0],
  },
  "lime_green": {
    "name": "Lime Green",
    "hex": "#32cd32",
    "rgb": [50, 205, 50],
  },
  "lime_web_x11_green": {
    "name": "Lime (Web) (X11 Green)",
    "hex": "#0f0",
    "rgb": [0, 255, 0],
  },
  "limerick": {
    "name": "Limerick",
    "hex": "#9dc209",
    "rgb": [157, 194, 9],
  },
  "lincoln_green": {
    "name": "Lincoln Green",
    "hex": "#195905",
    "rgb": [25, 89, 5],
  },
  "linen": {
    "name": "Linen",
    "hex": "#faf0e6",
    "rgb": [250, 240, 230],
  },
  "lion": {
    "name": "Lion",
    "hex": "#c19a6b",
    "rgb": [193, 154, 107],
  },
  "little_boy_blue": {
    "name": "Little Boy Blue",
    "hex": "#6ca0dc",
    "rgb": [108, 160, 220],
  },
  "liver": {
    "name": "Liver",
    "hex": "#534b4f",
    "rgb": [83, 75, 79],
  },
  "lust": {
    "name": "Lust",
    "hex": "#e62020",
    "rgb": [230, 32, 32],
  },
  "magenta": {
    "name": "Magenta",
    "hex": "#f0f",
    "rgb": [255, 0, 255],
  },
  "magenta_dye": {
    "name": "Magenta (Dye)",
    "hex": "#ca1f7b",
    "rgb": [202, 31, 123],
  },
  "magenta_process": {
    "name": "Magenta (Process)",
    "hex": "#ff0090",
    "rgb": [255, 0, 144],
  },
  "magic_mint": {
    "name": "Magic Mint",
    "hex": "#aaf0d1",
    "rgb": [170, 240, 209],
  },
  "magnolia": {
    "name": "Magnolia",
    "hex": "#f8f4ff",
    "rgb": [248, 244, 255],
  },
  "mahogany": {
    "name": "Mahogany",
    "hex": "#c04000",
    "rgb": [192, 64, 0],
  },
  "maize": {
    "name": "Maize",
    "hex": "#fbec5d",
    "rgb": [251, 236, 93],
  },
  "majorelle_blue": {
    "name": "Majorelle Blue",
    "hex": "#6050dc",
    "rgb": [96, 80, 220],
  },
  "malachite": {
    "name": "Malachite",
    "hex": "#0bda51",
    "rgb": [11, 218, 81],
  },
  "manatee": {
    "name": "Manatee",
    "hex": "#979aaa",
    "rgb": [151, 154, 170],
  },
  "mango_tango": {
    "name": "Mango Tango",
    "hex": "#ff8243",
    "rgb": [255, 130, 67],
  },
  "mantis": {
    "name": "Mantis",
    "hex": "#74c365",
    "rgb": [116, 195, 101],
  },
  "mardi_gras": {
    "name": "Mardi Gras",
    "hex": "#880085",
    "rgb": [136, 0, 133],
  },
  "maroon_crayola": {
    "name": "Maroon (Crayola)",
    "hex": "#c32148",
    "rgb": [195, 33, 72],
  },
  "maroon_html_css": {
    "name": "Maroon (Html/Css)",
    "hex": "#800000",
    "rgb": [128, 0, 0],
  },
  "maroon_x11": {
    "name": "Maroon (X11)",
    "hex": "#b03060",
    "rgb": [176, 48, 96],
  },
  "mauve": {
    "name": "Mauve",
    "hex": "#e0b0ff",
    "rgb": [224, 176, 255],
  },
  "mauve_taupe": {
    "name": "Mauve Taupe",
    "hex": "#915f6d",
    "rgb": [145, 95, 109],
  },
  "mauvelous": {
    "name": "Mauvelous",
    "hex": "#ef98aa",
    "rgb": [239, 152, 170],
  },
  "maya_blue": {
    "name": "Maya Blue",
    "hex": "#73c2fb",
    "rgb": [115, 194, 251],
  },
  "meat_brown": {
    "name": "Meat Brown",
    "hex": "#e5b73b",
    "rgb": [229, 183, 59],
  },
  "medium_aquamarine": {
    "name": "Medium Aquamarine",
    "hex": "#6da",
    "rgb": [102, 221, 170],
  },
  "medium_blue": {
    "name": "Medium Blue",
    "hex": "#0000cd",
    "rgb": [0, 0, 205],
  },
  "medium_candy_apple_red": {
    "name": "Medium Candy Apple Red",
    "hex": "#e2062c",
    "rgb": [226, 6, 44],
  },
  "medium_carmine": {
    "name": "Medium Carmine",
    "hex": "#af4035",
    "rgb": [175, 64, 53],
  },
  "medium_champagne": {
    "name": "Medium Champagne",
    "hex": "#f3e5ab",
    "rgb": [243, 229, 171],
  },
  "medium_electric_blue": {
    "name": "Medium Electric Blue",
    "hex": "#035096",
    "rgb": [3, 80, 150],
  },
  "medium_jungle_green": {
    "name": "Medium Jungle Green",
    "hex": "#1c352d",
    "rgb": [28, 53, 45],
  },
  "medium_lavender_magenta": {
    "name": "Medium Lavender Magenta",
    "hex": "#dda0dd",
    "rgb": [221, 160, 221],
  },
  "medium_orchid": {
    "name": "Medium Orchid",
    "hex": "#ba55d3",
    "rgb": [186, 85, 211],
  },
  "medium_persian_blue": {
    "name": "Medium Persian Blue",
    "hex": "#0067a5",
    "rgb": [0, 103, 165],
  },
  "medium_purple": {
    "name": "Medium Purple",
    "hex": "#9370db",
    "rgb": [147, 112, 219],
  },
  "medium_red_violet": {
    "name": "Medium Red-Violet",
    "hex": "#bb3385",
    "rgb": [187, 51, 133],
  },
  "medium_ruby": {
    "name": "Medium Ruby",
    "hex": "#aa4069",
    "rgb": [170, 64, 105],
  },
  "medium_sea_green": {
    "name": "Medium Sea Green",
    "hex": "#3cb371",
    "rgb": [60, 179, 113],
  },
  "medium_slate_blue": {
    "name": "Medium Slate Blue",
    "hex": "#7b68ee",
    "rgb": [123, 104, 238],
  },
  "medium_spring_bud": {
    "name": "Medium Spring Bud",
    "hex": "#c9dc87",
    "rgb": [201, 220, 135],
  },
  "medium_spring_green": {
    "name": "Medium Spring Green",
    "hex": "#00fa9a",
    "rgb": [0, 250, 154],
  },
  "medium_taupe": {
    "name": "Medium Taupe",
    "hex": "#674c47",
    "rgb": [103, 76, 71],
  },
  "medium_turquoise": {
    "name": "Medium Turquoise",
    "hex": "#48d1cc",
    "rgb": [72, 209, 204],
  },
  "medium_tuscan_red": {
    "name": "Medium Tuscan Red",
    "hex": "#79443b",
    "rgb": [121, 68, 59],
  },
  "medium_vermilion": {
    "name": "Medium Vermilion",
    "hex": "#d9603b",
    "rgb": [217, 96, 59],
  },
  "medium_violet_red": {
    "name": "Medium Violet-Red",
    "hex": "#c71585",
    "rgb": [199, 21, 133],
  },
  "mellow_apricot": {
    "name": "Mellow Apricot",
    "hex": "#f8b878",
    "rgb": [248, 184, 120],
  },
  "mellow_yellow": {
    "name": "Mellow Yellow",
    "hex": "#f8de7e",
    "rgb": [248, 222, 126],
  },
  "melon": {
    "name": "Melon",
    "hex": "#fdbcb4",
    "rgb": [253, 188, 180],
  },
  "midnight_blue": {
    "name": "Midnight Blue",
    "hex": "#191970",
    "rgb": [25, 25, 112],
  },
  "midnight_green_eagle_green": {
    "name": "Midnight Green (Eagle Green)",
    "hex": "#004953",
    "rgb": [0, 73, 83],
  },
  "mikado_yellow": {
    "name": "Mikado Yellow",
    "hex": "#ffc40c",
    "rgb": [255, 196, 12],
  },
  "mint": {
    "name": "Mint",
    "hex": "#3eb489",
    "rgb": [62, 180, 137],
  },
  "mint_cream": {
    "name": "Mint Cream",
    "hex": "#f5fffa",
    "rgb": [245, 255, 250],
  },
  "mint_green": {
    "name": "Mint Green",
    "hex": "#98ff98",
    "rgb": [152, 255, 152],
  },
  "misty_rose": {
    "name": "Misty Rose",
    "hex": "#ffe4e1",
    "rgb": [255, 228, 225],
  },
  "moccasin": {
    "name": "Moccasin",
    "hex": "#faebd7",
    "rgb": [250, 235, 215],
  },
  "mode_beige": {
    "name": "Mode Beige",
    "hex": "#967117",
    "rgb": [150, 113, 23],
  },
  "moonstone_blue": {
    "name": "Moonstone Blue",
    "hex": "#73a9c2",
    "rgb": [115, 169, 194],
  },
  "mordant_red_19": {
    "name": "Mordant Red 19",
    "hex": "#ae0c00",
    "rgb": [174, 12, 0],
  },
  "moss_green": {
    "name": "Moss Green",
    "hex": "#addfad",
    "rgb": [173, 223, 173],
  },
  "mountain_meadow": {
    "name": "Mountain Meadow",
    "hex": "#30ba8f",
    "rgb": [48, 186, 143],
  },
  "mountbatten_pink": {
    "name": "Mountbatten Pink",
    "hex": "#997a8d",
    "rgb": [153, 122, 141],
  },
  "msu_green": {
    "name": "Msu Green",
    "hex": "#18453b",
    "rgb": [24, 69, 59],
  },
  "mulberry": {
    "name": "Mulberry",
    "hex": "#c54b8c",
    "rgb": [197, 75, 140],
  },
  "mustard": {
    "name": "Mustard",
    "hex": "#ffdb58",
    "rgb": [255, 219, 88],
  },
  "myrtle": {
    "name": "Myrtle",
    "hex": "#21421e",
    "rgb": [33, 66, 30],
  },
  "nadeshiko_pink": {
    "name": "Nadeshiko Pink",
    "hex": "#f6adc6",
    "rgb": [246, 173, 198],
  },
  "napier_green": {
    "name": "Napier Green",
    "hex": "#2a8000",
    "rgb": [42, 128, 0],
  },
  "naples_yellow": {
    "name": "Naples Yellow",
    "hex": "#fada5e",
    "rgb": [250, 218, 94],
  },
  "navajo_white": {
    "name": "Navajo White",
    "hex": "#ffdead",
    "rgb": [255, 222, 173],
  },
  "navy_blue": {
    "name": "Navy Blue",
    "hex": "#000080",
    "rgb": [0, 0, 128],
  },
  "neon_carrot": {
    "name": "Neon Carrot",
    "hex": "#ffa343",
    "rgb": [255, 163, 67],
  },
  "neon_fuchsia": {
    "name": "Neon Fuchsia",
    "hex": "#fe4164",
    "rgb": [254, 65, 100],
  },
  "neon_green": {
    "name": "Neon Green",
    "hex": "#39ff14",
    "rgb": [57, 255, 20],
  },
  "new_york_pink": {
    "name": "New York Pink",
    "hex": "#d7837f",
    "rgb": [215, 131, 127],
  },
  "non_photo_blue": {
    "name": "Non-Photo Blue",
    "hex": "#a4dded",
    "rgb": [164, 221, 237],
  },
  "north_texas_green": {
    "name": "North Texas Green",
    "hex": "#059033",
    "rgb": [5, 144, 51],
  },
  "ocean_boat_blue": {
    "name": "Ocean Boat Blue",
    "hex": "#0077be",
    "rgb": [0, 119, 190],
  },
  "ochre": {
    "name": "Ochre",
    "hex": "#c72",
    "rgb": [204, 119, 34],
  },
  "office_green": {
    "name": "Office Green",
    "hex": "#008000",
    "rgb": [0, 128, 0],
  },
  "old_gold": {
    "name": "Old Gold",
    "hex": "#cfb53b",
    "rgb": [207, 181, 59],
  },
  "old_lace": {
    "name": "Old Lace",
    "hex": "#fdf5e6",
    "rgb": [253, 245, 230],
  },
  "old_lavender": {
    "name": "Old Lavender",
    "hex": "#796878",
    "rgb": [121, 104, 120],
  },
  "old_mauve": {
    "name": "Old Mauve",
    "hex": "#673147",
    "rgb": [103, 49, 71],
  },
  "old_rose": {
    "name": "Old Rose",
    "hex": "#c08081",
    "rgb": [192, 128, 129],
  },
  "olive": {
    "name": "Olive",
    "hex": "#808000",
    "rgb": [128, 128, 0],
  },
  "olive_drab_7": {
    "name": "Olive Drab #7",
    "hex": "#3c341f",
    "rgb": [60, 52, 31],
  },
  "olive_drab_web_olive_drab_3": {
    "name": "Olive Drab (Web) (Olive Drab #3)",
    "hex": "#6b8e23",
    "rgb": [107, 142, 35],
  },
  "olivine": {
    "name": "Olivine",
    "hex": "#9ab973",
    "rgb": [154, 185, 115],
  },
  "onyx": {
    "name": "Onyx",
    "hex": "#353839",
    "rgb": [53, 56, 57],
  },
  "opera_mauve": {
    "name": "Opera Mauve",
    "hex": "#b784a7",
    "rgb": [183, 132, 167],
  },
  "orange_color_wheel": {
    "name": "Orange (Color Wheel)",
    "hex": "#ff7f00",
    "rgb": [255, 127, 0],
  },
  "orange_peel": {
    "name": "Orange Peel",
    "hex": "#ff9f00",
    "rgb": [255, 159, 0],
  },
  "orange_red": {
    "name": "Orange-Red",
    "hex": "#ff4500",
    "rgb": [255, 69, 0],
  },
  "orange_ryb": {
    "name": "Orange (Ryb)",
    "hex": "#fb9902",
    "rgb": [251, 153, 2],
  },
  "orange_web_color": {
    "name": "Orange (Web Color)",
    "hex": "#ffa500",
    "rgb": [255, 165, 0],
  },
  "orchid": {
    "name": "Orchid",
    "hex": "#da70d6",
    "rgb": [218, 112, 214],
  },
  "otter_brown": {
    "name": "Otter Brown",
    "hex": "#654321",
    "rgb": [101, 67, 33],
  },
  "ou_crimson_red": {
    "name": "Ou Crimson Red",
    "hex": "#900",
    "rgb": [153, 0, 0],
  },
  "outer_space": {
    "name": "Outer Space",
    "hex": "#414a4c",
    "rgb": [65, 74, 76],
  },
  "outrageous_orange": {
    "name": "Outrageous Orange",
    "hex": "#ff6e4a",
    "rgb": [255, 110, 74],
  },
  "oxford_blue": {
    "name": "Oxford Blue",
    "hex": "#002147",
    "rgb": [0, 33, 71],
  },
  "pakistan_green": {
    "name": "Pakistan Green",
    "hex": "#060",
    "rgb": [0, 102, 0],
  },
  "palatinate_blue": {
    "name": "Palatinate Blue",
    "hex": "#273be2",
    "rgb": [39, 59, 226],
  },
  "palatinate_purple": {
    "name": "Palatinate Purple",
    "hex": "#682860",
    "rgb": [104, 40, 96],
  },
  "pale_aqua": {
    "name": "Pale Aqua",
    "hex": "#bcd4e6",
    "rgb": [188, 212, 230],
  },
  "pale_blue": {
    "name": "Pale Blue",
    "hex": "#afeeee",
    "rgb": [175, 238, 238],
  },
  "pale_brown": {
    "name": "Pale Brown",
    "hex": "#987654",
    "rgb": [152, 118, 84],
  },
  "pale_carmine": {
    "name": "Pale Carmine",
    "hex": "#af4035",
    "rgb": [175, 64, 53],
  },
  "pale_cerulean": {
    "name": "Pale Cerulean",
    "hex": "#9bc4e2",
    "rgb": [155, 196, 226],
  },
  "pale_chestnut": {
    "name": "Pale Chestnut",
    "hex": "#ddadaf",
    "rgb": [221, 173, 175],
  },
  "pale_copper": {
    "name": "Pale Copper",
    "hex": "#da8a67",
    "rgb": [218, 138, 103],
  },
  "pale_cornflower_blue": {
    "name": "Pale Cornflower Blue",
    "hex": "#abcdef",
    "rgb": [171, 205, 239],
  },
  "pale_gold": {
    "name": "Pale Gold",
    "hex": "#e6be8a",
    "rgb": [230, 190, 138],
  },
  "pale_goldenrod": {
    "name": "Pale Goldenrod",
    "hex": "#eee8aa",
    "rgb": [238, 232, 170],
  },
  "pale_green": {
    "name": "Pale Green",
    "hex": "#98fb98",
    "rgb": [152, 251, 152],
  },
  "pale_lavender": {
    "name": "Pale Lavender",
    "hex": "#dcd0ff",
    "rgb": [220, 208, 255],
  },
  "pale_magenta": {
    "name": "Pale Magenta",
    "hex": "#f984e5",
    "rgb": [249, 132, 229],
  },
  "pale_pink": {
    "name": "Pale Pink",
    "hex": "#fadadd",
    "rgb": [250, 218, 221],
  },
  "pale_plum": {
    "name": "Pale Plum",
    "hex": "#dda0dd",
    "rgb": [221, 160, 221],
  },
  "pale_red_violet": {
    "name": "Pale Red-Violet",
    "hex": "#db7093",
    "rgb": [219, 112, 147],
  },
  "pale_robin_egg_blue": {
    "name": "Pale Robin Egg Blue",
    "hex": "#96ded1",
    "rgb": [150, 222, 209],
  },
  "pale_silver": {
    "name": "Pale Silver",
    "hex": "#c9c0bb",
    "rgb": [201, 192, 187],
  },
  "pale_spring_bud": {
    "name": "Pale Spring Bud",
    "hex": "#ecebbd",
    "rgb": [236, 235, 189],
  },
  "pale_taupe": {
    "name": "Pale Taupe",
    "hex": "#bc987e",
    "rgb": [188, 152, 126],
  },
  "pale_violet_red": {
    "name": "Pale Violet-Red",
    "hex": "#db7093",
    "rgb": [219, 112, 147],
  },
  "pansy_purple": {
    "name": "Pansy Purple",
    "hex": "#78184a",
    "rgb": [120, 24, 74],
  },
  "papaya_whip": {
    "name": "Papaya Whip",
    "hex": "#ffefd5",
    "rgb": [255, 239, 213],
  },
  "paris_green": {
    "name": "Paris Green",
    "hex": "#50c878",
    "rgb": [80, 200, 120],
  },
  "pastel_blue": {
    "name": "Pastel Blue",
    "hex": "#aec6cf",
    "rgb": [174, 198, 207],
  },
  "pastel_brown": {
    "name": "Pastel Brown",
    "hex": "#836953",
    "rgb": [131, 105, 83],
  },
  "pastel_gray": {
    "name": "Pastel Gray",
    "hex": "#cfcfc4",
    "rgb": [207, 207, 196],
  },
  "pastel_green": {
    "name": "Pastel Green",
    "hex": "#7d7",
    "rgb": [119, 221, 119],
  },
  "pastel_magenta": {
    "name": "Pastel Magenta",
    "hex": "#f49ac2",
    "rgb": [244, 154, 194],
  },
  "pastel_orange": {
    "name": "Pastel Orange",
    "hex": "#ffb347",
    "rgb": [255, 179, 71],
  },
  "pastel_pink": {
    "name": "Pastel Pink",
    "hex": "#dea5a4",
    "rgb": [222, 165, 164],
  },
  "pastel_purple": {
    "name": "Pastel Purple",
    "hex": "#b39eb5",
    "rgb": [179, 158, 181],
  },
  "pastel_red": {
    "name": "Pastel Red",
    "hex": "#ff6961",
    "rgb": [255, 105, 97],
  },
  "pastel_violet": {
    "name": "Pastel Violet",
    "hex": "#cb99c9",
    "rgb": [203, 153, 201],
  },
  "pastel_yellow": {
    "name": "Pastel Yellow",
    "hex": "#fdfd96",
    "rgb": [253, 253, 150],
  },
  "patriarch": {
    "name": "Patriarch",
    "hex": "#800080",
    "rgb": [128, 0, 128],
  },
  "payne_s_grey": {
    "name": "Payne'S Grey",
    "hex": "#536878",
    "rgb": [83, 104, 120],
  },
  "peach": {
    "name": "Peach",
    "hex": "#ffe5b4",
    "rgb": [255, 229, 180],
  },
  "peach_crayola": {
    "name": "Peach (Crayola)",
    "hex": "#ffcba4",
    "rgb": [255, 203, 164],
  },
  "peach_orange": {
    "name": "Peach-Orange",
    "hex": "#fc9",
    "rgb": [255, 204, 153],
  },
  "peach_puff": {
    "name": "Peach Puff",
    "hex": "#ffdab9",
    "rgb": [255, 218, 185],
  },
  "peach_yellow": {
    "name": "Peach-Yellow",
    "hex": "#fadfad",
    "rgb": [250, 223, 173],
  },
  "pear": {
    "name": "Pear",
    "hex": "#d1e231",
    "rgb": [209, 226, 49],
  },
  "pearl": {
    "name": "Pearl",
    "hex": "#eae0c8",
    "rgb": [234, 224, 200],
  },
  "pearl_aqua": {
    "name": "Pearl Aqua",
    "hex": "#88d8c0",
    "rgb": [136, 216, 192],
  },
  "pearly_purple": {
    "name": "Pearly Purple",
    "hex": "#b768a2",
    "rgb": [183, 104, 162],
  },
  "peridot": {
    "name": "Peridot",
    "hex": "#e6e200",
    "rgb": [230, 226, 0],
  },
  "periwinkle": {
    "name": "Periwinkle",
    "hex": "#ccf",
    "rgb": [204, 204, 255],
  },
  "persian_blue": {
    "name": "Persian Blue",
    "hex": "#1c39bb",
    "rgb": [28, 57, 187],
  },
  "persian_green": {
    "name": "Persian Green",
    "hex": "#00a693",
    "rgb": [0, 166, 147],
  },
  "persian_indigo": {
    "name": "Persian Indigo",
    "hex": "#32127a",
    "rgb": [50, 18, 122],
  },
  "persian_orange": {
    "name": "Persian Orange",
    "hex": "#d99058",
    "rgb": [217, 144, 88],
  },
  "persian_pink": {
    "name": "Persian Pink",
    "hex": "#f77fbe",
    "rgb": [247, 127, 190],
  },
  "persian_plum": {
    "name": "Persian Plum",
    "hex": "#701c1c",
    "rgb": [112, 28, 28],
  },
  "persian_red": {
    "name": "Persian Red",
    "hex": "#c33",
    "rgb": [204, 51, 51],
  },
  "persian_rose": {
    "name": "Persian Rose",
    "hex": "#fe28a2",
    "rgb": [254, 40, 162],
  },
  "persimmon": {
    "name": "Persimmon",
    "hex": "#ec5800",
    "rgb": [236, 88, 0],
  },
  "peru": {
    "name": "Peru",
    "hex": "#cd853f",
    "rgb": [205, 133, 63],
  },
  "phlox": {
    "name": "Phlox",
    "hex": "#df00ff",
    "rgb": [223, 0, 255],
  },
  "phthalo_blue": {
    "name": "Phthalo Blue",
    "hex": "#000f89",
    "rgb": [0, 15, 137],
  },
  "phthalo_green": {
    "name": "Phthalo Green",
    "hex": "#123524",
    "rgb": [18, 53, 36],
  },
  "piggy_pink": {
    "name": "Piggy Pink",
    "hex": "#fddde6",
    "rgb": [253, 221, 230],
  },
  "pine_green": {
    "name": "Pine Green",
    "hex": "#01796f",
    "rgb": [1, 121, 111],
  },
  "pink": {
    "name": "Pink",
    "hex": "#ffc0cb",
    "rgb": [255, 192, 203],
  },
  "pink_lace": {
    "name": "Pink Lace",
    "hex": "#ffddf4",
    "rgb": [255, 221, 244],
  },
  "pink_orange": {
    "name": "Pink-Orange",
    "hex": "#f96",
    "rgb": [255, 153, 102],
  },
  "pink_pearl": {
    "name": "Pink Pearl",
    "hex": "#e7accf",
    "rgb": [231, 172, 207],
  },
  "pink_sherbet": {
    "name": "Pink Sherbet",
    "hex": "#f78fa7",
    "rgb": [247, 143, 167],
  },
  "pistachio": {
    "name": "Pistachio",
    "hex": "#93c572",
    "rgb": [147, 197, 114],
  },
  "platinum": {
    "name": "Platinum",
    "hex": "#e5e4e2",
    "rgb": [229, 228, 226],
  },
  "plum_traditional": {
    "name": "Plum (Traditional)",
    "hex": "#8e4585",
    "rgb": [142, 69, 133],
  },
  "plum_web": {
    "name": "Plum (Web)",
    "hex": "#dda0dd",
    "rgb": [221, 160, 221],
  },
  "portland_orange": {
    "name": "Portland Orange",
    "hex": "#ff5a36",
    "rgb": [255, 90, 54],
  },
  "powder_blue_web": {
    "name": "Powder Blue (Web)",
    "hex": "#b0e0e6",
    "rgb": [176, 224, 230],
  },
  "princeton_orange": {
    "name": "Princeton Orange",
    "hex": "#ff8f00",
    "rgb": [255, 143, 0],
  },
  "prune": {
    "name": "Prune",
    "hex": "#701c1c",
    "rgb": [112, 28, 28],
  },
  "prussian_blue": {
    "name": "Prussian Blue",
    "hex": "#003153",
    "rgb": [0, 49, 83],
  },
  "psychedelic_purple": {
    "name": "Psychedelic Purple",
    "hex": "#df00ff",
    "rgb": [223, 0, 255],
  },
  "puce": {
    "name": "Puce",
    "hex": "#c89",
    "rgb": [204, 136, 153],
  },
  "pumpkin": {
    "name": "Pumpkin",
    "hex": "#ff7518",
    "rgb": [255, 117, 24],
  },
  "purple_heart": {
    "name": "Purple Heart",
    "hex": "#69359c",
    "rgb": [105, 53, 156],
  },
  "purple_html_css": {
    "name": "Purple (Html/Css)",
    "hex": "#800080",
    "rgb": [128, 0, 128],
  },
  "purple_mountain_majesty": {
    "name": "Purple Mountain Majesty",
    "hex": "#9678b6",
    "rgb": [150, 120, 182],
  },
  "purple_munsell": {
    "name": "Purple (Munsell)",
    "hex": "#9f00c5",
    "rgb": [159, 0, 197],
  },
  "purple_pizzazz": {
    "name": "Purple Pizzazz",
    "hex": "#fe4eda",
    "rgb": [254, 78, 218],
  },
  "purple_taupe": {
    "name": "Purple Taupe",
    "hex": "#50404d",
    "rgb": [80, 64, 77],
  },
  "purple_x11": {
    "name": "Purple (X11)",
    "hex": "#a020f0",
    "rgb": [160, 32, 240],
  },
  "quartz": {
    "name": "Quartz",
    "hex": "#51484f",
    "rgb": [81, 72, 79],
  },
  "rackley": {
    "name": "Rackley",
    "hex": "#5d8aa8",
    "rgb": [93, 138, 168],
  },
  "radical_red": {
    "name": "Radical Red",
    "hex": "#ff355e",
    "rgb": [255, 53, 94],
  },
  "rajah": {
    "name": "Rajah",
    "hex": "#fbab60",
    "rgb": [251, 171, 96],
  },
  "raspberry": {
    "name": "Raspberry",
    "hex": "#e30b5d",
    "rgb": [227, 11, 93],
  },
  "raspberry_glace": {
    "name": "Raspberry Glace",
    "hex": "#915f6d",
    "rgb": [145, 95, 109],
  },
  "raspberry_pink": {
    "name": "Raspberry Pink",
    "hex": "#e25098",
    "rgb": [226, 80, 152],
  },
  "raspberry_rose": {
    "name": "Raspberry Rose",
    "hex": "#b3446c",
    "rgb": [179, 68, 108],
  },
  "raw_umber": {
    "name": "Raw Umber",
    "hex": "#826644",
    "rgb": [130, 102, 68],
  },
  "razzle_dazzle_rose": {
    "name": "Razzle Dazzle Rose",
    "hex": "#f3c",
    "rgb": [255, 51, 204],
  },
  "razzmatazz": {
    "name": "Razzmatazz",
    "hex": "#e3256b",
    "rgb": [227, 37, 107],
  },
  "red": {
    "name": "Red",
    "hex": "#f00",
    "rgb": [255, 0, 0],
  },
  "red_brown": {
    "name": "Red-Brown",
    "hex": "#a52a2a",
    "rgb": [165, 42, 42],
  },
  "red_devil": {
    "name": "Red Devil",
    "hex": "#860111",
    "rgb": [134, 1, 17],
  },
  "red_munsell": {
    "name": "Red (Munsell)",
    "hex": "#f2003c",
    "rgb": [242, 0, 60],
  },
  "red_ncs": {
    "name": "Red (Ncs)",
    "hex": "#c40233",
    "rgb": [196, 2, 51],
  },
  "red_orange": {
    "name": "Red-Orange",
    "hex": "#ff5349",
    "rgb": [255, 83, 73],
  },
  "red_pigment": {
    "name": "Red (Pigment)",
    "hex": "#ed1c24",
    "rgb": [237, 28, 36],
  },
  "red_ryb": {
    "name": "Red (Ryb)",
    "hex": "#fe2712",
    "rgb": [254, 39, 18],
  },
  "red_violet": {
    "name": "Red-Violet",
    "hex": "#c71585",
    "rgb": [199, 21, 133],
  },
  "redwood": {
    "name": "Redwood",
    "hex": "#ab4e52",
    "rgb": [171, 78, 82],
  },
  "regalia": {
    "name": "Regalia",
    "hex": "#522d80",
    "rgb": [82, 45, 128],
  },
  "resolution_blue": {
    "name": "Resolution Blue",
    "hex": "#002387",
    "rgb": [0, 35, 135],
  },
  "rich_black": {
    "name": "Rich Black",
    "hex": "#004040",
    "rgb": [0, 64, 64],
  },
  "rich_brilliant_lavender": {
    "name": "Rich Brilliant Lavender",
    "hex": "#f1a7fe",
    "rgb": [241, 167, 254],
  },
  "rich_carmine": {
    "name": "Rich Carmine",
    "hex": "#d70040",
    "rgb": [215, 0, 64],
  },
  "rich_electric_blue": {
    "name": "Rich Electric Blue",
    "hex": "#0892d0",
    "rgb": [8, 146, 208],
  },
  "rich_lavender": {
    "name": "Rich Lavender",
    "hex": "#a76bcf",
    "rgb": [167, 107, 207],
  },
  "rich_lilac": {
    "name": "Rich Lilac",
    "hex": "#b666d2",
    "rgb": [182, 102, 210],
  },
  "rich_maroon": {
    "name": "Rich Maroon",
    "hex": "#b03060",
    "rgb": [176, 48, 96],
  },
  "rifle_green": {
    "name": "Rifle Green",
    "hex": "#414833",
    "rgb": [65, 72, 51],
  },
  "robin_egg_blue": {
    "name": "Robin Egg Blue",
    "hex": "#0cc",
    "rgb": [0, 204, 204],
  },
  "rose": {
    "name": "Rose",
    "hex": "#ff007f",
    "rgb": [255, 0, 127],
  },
  "rose_bonbon": {
    "name": "Rose Bonbon",
    "hex": "#f9429e",
    "rgb": [249, 66, 158],
  },
  "rose_ebony": {
    "name": "Rose Ebony",
    "hex": "#674846",
    "rgb": [103, 72, 70],
  },
  "rose_gold": {
    "name": "Rose Gold",
    "hex": "#b76e79",
    "rgb": [183, 110, 121],
  },
  "rose_madder": {
    "name": "Rose Madder",
    "hex": "#e32636",
    "rgb": [227, 38, 54],
  },
  "rose_pink": {
    "name": "Rose Pink",
    "hex": "#f6c",
    "rgb": [255, 102, 204],
  },
  "rose_quartz": {
    "name": "Rose Quartz",
    "hex": "#aa98a9",
    "rgb": [170, 152, 169],
  },
  "rose_taupe": {
    "name": "Rose Taupe",
    "hex": "#905d5d",
    "rgb": [144, 93, 93],
  },
  "rose_vale": {
    "name": "Rose Vale",
    "hex": "#ab4e52",
    "rgb": [171, 78, 82],
  },
  "rosewood": {
    "name": "Rosewood",
    "hex": "#65000b",
    "rgb": [101, 0, 11],
  },
  "rosso_corsa": {
    "name": "Rosso Corsa",
    "hex": "#d40000",
    "rgb": [212, 0, 0],
  },
  "rosy_brown": {
    "name": "Rosy Brown",
    "hex": "#bc8f8f",
    "rgb": [188, 143, 143],
  },
  "royal_azure": {
    "name": "Royal Azure",
    "hex": "#0038a8",
    "rgb": [0, 56, 168],
  },
  "royal_blue_traditional": {
    "name": "Royal Blue (Traditional)",
    "hex": "#002366",
    "rgb": [0, 35, 102],
  },
  "royal_blue_web": {
    "name": "Royal Blue (Web)",
    "hex": "#4169e1",
    "rgb": [65, 105, 225],
  },
  "royal_fuchsia": {
    "name": "Royal Fuchsia",
    "hex": "#ca2c92",
    "rgb": [202, 44, 146],
  },
  "royal_purple": {
    "name": "Royal Purple",
    "hex": "#7851a9",
    "rgb": [120, 81, 169],
  },
  "royal_yellow": {
    "name": "Royal Yellow",
    "hex": "#fada5e",
    "rgb": [250, 218, 94],
  },
  "rubine_red": {
    "name": "Rubine Red",
    "hex": "#d10056",
    "rgb": [209, 0, 86],
  },
  "ruby": {
    "name": "Ruby",
    "hex": "#e0115f",
    "rgb": [224, 17, 95],
  },
  "ruby_red": {
    "name": "Ruby Red",
    "hex": "#9b111e",
    "rgb": [155, 17, 30],
  },
  "ruddy": {
    "name": "Ruddy",
    "hex": "#ff0028",
    "rgb": [255, 0, 40],
  },
  "ruddy_brown": {
    "name": "Ruddy Brown",
    "hex": "#bb6528",
    "rgb": [187, 101, 40],
  },
  "ruddy_pink": {
    "name": "Ruddy Pink",
    "hex": "#e18e96",
    "rgb": [225, 142, 150],
  },
  "rufous": {
    "name": "Rufous",
    "hex": "#a81c07",
    "rgb": [168, 28, 7],
  },
  "russet": {
    "name": "Russet",
    "hex": "#80461b",
    "rgb": [128, 70, 27],
  },
  "rust": {
    "name": "Rust",
    "hex": "#b7410e",
    "rgb": [183, 65, 14],
  },
  "rusty_red": {
    "name": "Rusty Red",
    "hex": "#da2c43",
    "rgb": [218, 44, 67],
  },
  "sacramento_state_green": {
    "name": "Sacramento State Green",
    "hex": "#00563f",
    "rgb": [0, 86, 63],
  },
  "saddle_brown": {
    "name": "Saddle Brown",
    "hex": "#8b4513",
    "rgb": [139, 69, 19],
  },
  "safety_orange_blaze_orange": {
    "name": "Safety Orange (Blaze Orange)",
    "hex": "#ff6700",
    "rgb": [255, 103, 0],
  },
  "saffron": {
    "name": "Saffron",
    "hex": "#f4c430",
    "rgb": [244, 196, 48],
  },
  "salmon": {
    "name": "Salmon",
    "hex": "#ff8c69",
    "rgb": [255, 140, 105],
  },
  "salmon_pink": {
    "name": "Salmon Pink",
    "hex": "#ff91a4",
    "rgb": [255, 145, 164],
  },
  "sand": {
    "name": "Sand",
    "hex": "#c2b280",
    "rgb": [194, 178, 128],
  },
  "sand_dune": {
    "name": "Sand Dune",
    "hex": "#967117",
    "rgb": [150, 113, 23],
  },
  "sandstorm": {
    "name": "Sandstorm",
    "hex": "#ecd540",
    "rgb": [236, 213, 64],
  },
  "sandy_brown": {
    "name": "Sandy Brown",
    "hex": "#f4a460",
    "rgb": [244, 164, 96],
  },
  "sandy_taupe": {
    "name": "Sandy Taupe",
    "hex": "#967117",
    "rgb": [150, 113, 23],
  },
  "sangria": {
    "name": "Sangria",
    "hex": "#92000a",
    "rgb": [146, 0, 10],
  },
  "sap_green": {
    "name": "Sap Green",
    "hex": "#507d2a",
    "rgb": [80, 125, 42],
  },
  "sapphire": {
    "name": "Sapphire",
    "hex": "#0f52ba",
    "rgb": [15, 82, 186],
  },
  "sapphire_blue": {
    "name": "Sapphire Blue",
    "hex": "#0067a5",
    "rgb": [0, 103, 165],
  },
  "satin_sheen_gold": {
    "name": "Satin Sheen Gold",
    "hex": "#cba135",
    "rgb": [203, 161, 53],
  },
  "scarlet": {
    "name": "Scarlet",
    "hex": "#ff2400",
    "rgb": [255, 36, 0],
  },
  "scarlet_crayola": {
    "name": "Scarlet (Crayola)",
    "hex": "#fd0e35",
    "rgb": [253, 14, 53],
  },
  "school_bus_yellow": {
    "name": "School Bus Yellow",
    "hex": "#ffd800",
    "rgb": [255, 216, 0],
  },
  "screamin_green": {
    "name": "Screamin' Green",
    "hex": "#76ff7a",
    "rgb": [118, 255, 122],
  },
  "sea_blue": {
    "name": "Sea Blue",
    "hex": "#006994",
    "rgb": [0, 105, 148],
  },
  "sea_green": {
    "name": "Sea Green",
    "hex": "#2e8b57",
    "rgb": [46, 139, 87],
  },
  "seal_brown": {
    "name": "Seal Brown",
    "hex": "#321414",
    "rgb": [50, 20, 20],
  },
  "seashell": {
    "name": "Seashell",
    "hex": "#fff5ee",
    "rgb": [255, 245, 238],
  },
  "selective_yellow": {
    "name": "Selective Yellow",
    "hex": "#ffba00",
    "rgb": [255, 186, 0],
  },
  "sepia": {
    "name": "Sepia",
    "hex": "#704214",
    "rgb": [112, 66, 20],
  },
  "shadow": {
    "name": "Shadow",
    "hex": "#8a795d",
    "rgb": [138, 121, 93],
  },
  "shamrock_green": {
    "name": "Shamrock Green",
    "hex": "#009e60",
    "rgb": [0, 158, 96],
  },
  "shocking_pink": {
    "name": "Shocking Pink",
    "hex": "#fc0fc0",
    "rgb": [252, 15, 192],
  },
  "shocking_pink_crayola": {
    "name": "Shocking Pink (Crayola)",
    "hex": "#ff6fff",
    "rgb": [255, 111, 255],
  },
  "sienna": {
    "name": "Sienna",
    "hex": "#882d17",
    "rgb": [136, 45, 23],
  },
  "silver": {
    "name": "Silver",
    "hex": "#c0c0c0",
    "rgb": [192, 192, 192],
  },
  "sinopia": {
    "name": "Sinopia",
    "hex": "#cb410b",
    "rgb": [203, 65, 11],
  },
  "skobeloff": {
    "name": "Skobeloff",
    "hex": "#007474",
    "rgb": [0, 116, 116],
  },
  "sky_blue": {
    "name": "Sky Blue",
    "hex": "#87ceeb",
    "rgb": [135, 206, 235],
  },
  "sky_magenta": {
    "name": "Sky Magenta",
    "hex": "#cf71af",
    "rgb": [207, 113, 175],
  },
  "slate_blue": {
    "name": "Slate Blue",
    "hex": "#6a5acd",
    "rgb": [106, 90, 205],
  },
  "slate_gray": {
    "name": "Slate Gray",
    "hex": "#708090",
    "rgb": [112, 128, 144],
  },
  "smalt_dark_powder_blue": {
    "name": "Smalt (Dark Powder Blue)",
    "hex": "#039",
    "rgb": [0, 51, 153],
  },
  "smokey_topaz": {
    "name": "Smokey Topaz",
    "hex": "#933d41",
    "rgb": [147, 61, 65],
  },
  "smoky_black": {
    "name": "Smoky Black",
    "hex": "#100c08",
    "rgb": [16, 12, 8],
  },
  "snow": {
    "name": "Snow",
    "hex": "#fffafa",
    "rgb": [255, 250, 250],
  },
  "spiro_disco_ball": {
    "name": "Spiro Disco Ball",
    "hex": "#0fc0fc",
    "rgb": [15, 192, 252],
  },
  "spring_bud": {
    "name": "Spring Bud",
    "hex": "#a7fc00",
    "rgb": [167, 252, 0],
  },
  "spring_green": {
    "name": "Spring Green",
    "hex": "#00ff7f",
    "rgb": [0, 255, 127],
  },
  "st_patrick_s_blue": {
    "name": "St. Patrick'S Blue",
    "hex": "#23297a",
    "rgb": [35, 41, 122],
  },
  "steel_blue": {
    "name": "Steel Blue",
    "hex": "#4682b4",
    "rgb": [70, 130, 180],
  },
  "stil_de_grain_yellow": {
    "name": "Stil De Grain Yellow",
    "hex": "#fada5e",
    "rgb": [250, 218, 94],
  },
  "stizza": {
    "name": "Stizza",
    "hex": "#900",
    "rgb": [153, 0, 0],
  },
  "stormcloud": {
    "name": "Stormcloud",
    "hex": "#4f666a",
    "rgb": [79, 102, 106],
  },
  "straw": {
    "name": "Straw",
    "hex": "#e4d96f",
    "rgb": [228, 217, 111],
  },
  "sunglow": {
    "name": "Sunglow",
    "hex": "#fc3",
    "rgb": [255, 204, 51],
  },
  "sunset": {
    "name": "Sunset",
    "hex": "#fad6a5",
    "rgb": [250, 214, 165],
  },
  "tan": {
    "name": "Tan",
    "hex": "#d2b48c",
    "rgb": [210, 180, 140],
  },
  "tangelo": {
    "name": "Tangelo",
    "hex": "#f94d00",
    "rgb": [249, 77, 0],
  },
  "tangerine": {
    "name": "Tangerine",
    "hex": "#f28500",
    "rgb": [242, 133, 0],
  },
  "tangerine_yellow": {
    "name": "Tangerine Yellow",
    "hex": "#fc0",
    "rgb": [255, 204, 0],
  },
  "tango_pink": {
    "name": "Tango Pink",
    "hex": "#e4717a",
    "rgb": [228, 113, 122],
  },
  "taupe": {
    "name": "Taupe",
    "hex": "#483c32",
    "rgb": [72, 60, 50],
  },
  "taupe_gray": {
    "name": "Taupe Gray",
    "hex": "#8b8589",
    "rgb": [139, 133, 137],
  },
  "tea_green": {
    "name": "Tea Green",
    "hex": "#d0f0c0",
    "rgb": [208, 240, 192],
  },
  "tea_rose_orange": {
    "name": "Tea Rose (Orange)",
    "hex": "#f88379",
    "rgb": [248, 131, 121],
  },
  "tea_rose_rose": {
    "name": "Tea Rose (Rose)",
    "hex": "#f4c2c2",
    "rgb": [244, 194, 194],
  },
  "teal": {
    "name": "Teal",
    "hex": "#008080",
    "rgb": [0, 128, 128],
  },
  "teal_blue": {
    "name": "Teal Blue",
    "hex": "#367588",
    "rgb": [54, 117, 136],
  },
  "teal_green": {
    "name": "Teal Green",
    "hex": "#00827f",
    "rgb": [0, 130, 127],
  },
  "telemagenta": {
    "name": "Telemagenta",
    "hex": "#cf3476",
    "rgb": [207, 52, 118],
  },
  "tenn_tawny": {
    "name": "Tenné (Tawny)",
    "hex": "#cd5700",
    "rgb": [205, 87, 0],
  },
  "terra_cotta": {
    "name": "Terra Cotta",
    "hex": "#e2725b",
    "rgb": [226, 114, 91],
  },
  "thistle": {
    "name": "Thistle",
    "hex": "#d8bfd8",
    "rgb": [216, 191, 216],
  },
  "thulian_pink": {
    "name": "Thulian Pink",
    "hex": "#de6fa1",
    "rgb": [222, 111, 161],
  },
  "tickle_me_pink": {
    "name": "Tickle Me Pink",
    "hex": "#fc89ac",
    "rgb": [252, 137, 172],
  },
  "tiffany_blue": {
    "name": "Tiffany Blue",
    "hex": "#0abab5",
    "rgb": [10, 186, 181],
  },
  "tiger_s_eye": {
    "name": "Tiger'S Eye",
    "hex": "#e08d3c",
    "rgb": [224, 141, 60],
  },
  "timberwolf": {
    "name": "Timberwolf",
    "hex": "#dbd7d2",
    "rgb": [219, 215, 210],
  },
  "titanium_yellow": {
    "name": "Titanium Yellow",
    "hex": "#eee600",
    "rgb": [238, 230, 0],
  },
  "tomato": {
    "name": "Tomato",
    "hex": "#ff6347",
    "rgb": [255, 99, 71],
  },
  "toolbox": {
    "name": "Toolbox",
    "hex": "#746cc0",
    "rgb": [116, 108, 192],
  },
  "topaz": {
    "name": "Topaz",
    "hex": "#ffc87c",
    "rgb": [255, 200, 124],
  },
  "tractor_red": {
    "name": "Tractor Red",
    "hex": "#fd0e35",
    "rgb": [253, 14, 53],
  },
  "trolley_grey": {
    "name": "Trolley Grey",
    "hex": "#808080",
    "rgb": [128, 128, 128],
  },
  "tropical_rain_forest": {
    "name": "Tropical Rain Forest",
    "hex": "#00755e",
    "rgb": [0, 117, 94],
  },
  "true_blue": {
    "name": "True Blue",
    "hex": "#0073cf",
    "rgb": [0, 115, 207],
  },
  "tufts_blue": {
    "name": "Tufts Blue",
    "hex": "#417dc1",
    "rgb": [65, 125, 193],
  },
  "tumbleweed": {
    "name": "Tumbleweed",
    "hex": "#deaa88",
    "rgb": [222, 170, 136],
  },
  "turkish_rose": {
    "name": "Turkish Rose",
    "hex": "#b57281",
    "rgb": [181, 114, 129],
  },
  "turquoise": {
    "name": "Turquoise",
    "hex": "#30d5c8",
    "rgb": [48, 213, 200],
  },
  "turquoise_blue": {
    "name": "Turquoise Blue",
    "hex": "#00ffef",
    "rgb": [0, 255, 239],
  },
  "turquoise_green": {
    "name": "Turquoise Green",
    "hex": "#a0d6b4",
    "rgb": [160, 214, 180],
  },
  "tuscan_red": {
    "name": "Tuscan Red",
    "hex": "#7c4848",
    "rgb": [124, 72, 72],
  },
  "twilight_lavender": {
    "name": "Twilight Lavender",
    "hex": "#8a496b",
    "rgb": [138, 73, 107],
  },
  "tyrian_purple": {
    "name": "Tyrian Purple",
    "hex": "#66023c",
    "rgb": [102, 2, 60],
  },
  "ua_blue": {
    "name": "Ua Blue",
    "hex": "#03a",
    "rgb": [0, 51, 170],
  },
  "ua_red": {
    "name": "Ua Red",
    "hex": "#d9004c",
    "rgb": [217, 0, 76],
  },
  "ube": {
    "name": "Ube",
    "hex": "#8878c3",
    "rgb": [136, 120, 195],
  },
  "ucla_blue": {
    "name": "Ucla Blue",
    "hex": "#536895",
    "rgb": [83, 104, 149],
  },
  "ucla_gold": {
    "name": "Ucla Gold",
    "hex": "#ffb300",
    "rgb": [255, 179, 0],
  },
  "ufo_green": {
    "name": "Ufo Green",
    "hex": "#3cd070",
    "rgb": [60, 208, 112],
  },
  "ultra_pink": {
    "name": "Ultra Pink",
    "hex": "#ff6fff",
    "rgb": [255, 111, 255],
  },
  "ultramarine": {
    "name": "Ultramarine",
    "hex": "#120a8f",
    "rgb": [18, 10, 143],
  },
  "ultramarine_blue": {
    "name": "Ultramarine Blue",
    "hex": "#4166f5",
    "rgb": [65, 102, 245],
  },
  "umber": {
    "name": "Umber",
    "hex": "#635147",
    "rgb": [99, 81, 71],
  },
  "unbleached_silk": {
    "name": "Unbleached Silk",
    "hex": "#ffddca",
    "rgb": [255, 221, 202],
  },
  "united_nations_blue": {
    "name": "United Nations Blue",
    "hex": "#5b92e5",
    "rgb": [91, 146, 229],
  },
  "university_of_california_gold": {
    "name": "University Of California Gold",
    "hex": "#b78727",
    "rgb": [183, 135, 39],
  },
  "unmellow_yellow": {
    "name": "Unmellow Yellow",
    "hex": "#ff6",
    "rgb": [255, 255, 102],
  },
  "up_forest_green": {
    "name": "Up Forest Green",
    "hex": "#014421",
    "rgb": [1, 68, 33],
  },
  "up_maroon": {
    "name": "Up Maroon",
    "hex": "#7b1113",
    "rgb": [123, 17, 19],
  },
  "upsdell_red": {
    "name": "Upsdell Red",
    "hex": "#ae2029",
    "rgb": [174, 32, 41],
  },
  "urobilin": {
    "name": "Urobilin",
    "hex": "#e1ad21",
    "rgb": [225, 173, 33],
  },
  "usafa_blue": {
    "name": "Usafa Blue",
    "hex": "#004f98",
    "rgb": [0, 79, 152],
  },
  "usc_cardinal": {
    "name": "Usc Cardinal",
    "hex": "#900",
    "rgb": [153, 0, 0],
  },
  "usc_gold": {
    "name": "Usc Gold",
    "hex": "#fc0",
    "rgb": [255, 204, 0],
  },
  "utah_crimson": {
    "name": "Utah Crimson",
    "hex": "#d3003f",
    "rgb": [211, 0, 63],
  },
  "vanilla": {
    "name": "Vanilla",
    "hex": "#f3e5ab",
    "rgb": [243, 229, 171],
  },
  "vegas_gold": {
    "name": "Vegas Gold",
    "hex": "#c5b358",
    "rgb": [197, 179, 88],
  },
  "venetian_red": {
    "name": "Venetian Red",
    "hex": "#c80815",
    "rgb": [200, 8, 21],
  },
  "verdigris": {
    "name": "Verdigris",
    "hex": "#43b3ae",
    "rgb": [67, 179, 174],
  },
  "vermilion_cinnabar": {
    "name": "Vermilion (Cinnabar)",
    "hex": "#e34234",
    "rgb": [227, 66, 52],
  },
  "vermilion_plochere": {
    "name": "Vermilion (Plochere)",
    "hex": "#d9603b",
    "rgb": [217, 96, 59],
  },
  "veronica": {
    "name": "Veronica",
    "hex": "#a020f0",
    "rgb": [160, 32, 240],
  },
  "violet": {
    "name": "Violet",
    "hex": "#8f00ff",
    "rgb": [143, 0, 255],
  },
  "violet_blue": {
    "name": "Violet-Blue",
    "hex": "#324ab2",
    "rgb": [50, 74, 178],
  },
  "violet_color_wheel": {
    "name": "Violet (Color Wheel)",
    "hex": "#7f00ff",
    "rgb": [127, 0, 255],
  },
  "violet_ryb": {
    "name": "Violet (Ryb)",
    "hex": "#8601af",
    "rgb": [134, 1, 175],
  },
  "violet_web": {
    "name": "Violet (Web)",
    "hex": "#ee82ee",
    "rgb": [238, 130, 238],
  },
  "viridian": {
    "name": "Viridian",
    "hex": "#40826d",
    "rgb": [64, 130, 109],
  },
  "vivid_auburn": {
    "name": "Vivid Auburn",
    "hex": "#922724",
    "rgb": [146, 39, 36],
  },
  "vivid_burgundy": {
    "name": "Vivid Burgundy",
    "hex": "#9f1d35",
    "rgb": [159, 29, 53],
  },
  "vivid_cerise": {
    "name": "Vivid Cerise",
    "hex": "#da1d81",
    "rgb": [218, 29, 129],
  },
  "vivid_tangerine": {
    "name": "Vivid Tangerine",
    "hex": "#ffa089",
    "rgb": [255, 160, 137],
  },
  "vivid_violet": {
    "name": "Vivid Violet",
    "hex": "#9f00ff",
    "rgb": [159, 0, 255],
  },
  "warm_black": {
    "name": "Warm Black",
    "hex": "#004242",
    "rgb": [0, 66, 66],
  },
  "waterspout": {
    "name": "Waterspout",
    "hex": "#a4f4f9",
    "rgb": [164, 244, 249],
  },
  "wenge": {
    "name": "Wenge",
    "hex": "#645452",
    "rgb": [100, 84, 82],
  },
  "wheat": {
    "name": "Wheat",
    "hex": "#f5deb3",
    "rgb": [245, 222, 179],
  },
  "white": {
    "name": "White",
    "hex": "#fff",
    "rgb": [255, 255, 255],
  },
  "white_smoke": {
    "name": "White Smoke",
    "hex": "#f5f5f5",
    "rgb": [245, 245, 245],
  },
  "wild_blue_yonder": {
    "name": "Wild Blue Yonder",
    "hex": "#a2add0",
    "rgb": [162, 173, 208],
  },
  "wild_strawberry": {
    "name": "Wild Strawberry",
    "hex": "#ff43a4",
    "rgb": [255, 67, 164],
  },
  "wild_watermelon": {
    "name": "Wild Watermelon",
    "hex": "#fc6c85",
    "rgb": [252, 108, 133],
  },
  "wine": {
    "name": "Wine",
    "hex": "#722f37",
    "rgb": [114, 47, 55],
  },
  "wine_dregs": {
    "name": "Wine Dregs",
    "hex": "#673147",
    "rgb": [103, 49, 71],
  },
  "wisteria": {
    "name": "Wisteria",
    "hex": "#c9a0dc",
    "rgb": [201, 160, 220],
  },
  "wood_brown": {
    "name": "Wood Brown",
    "hex": "#c19a6b",
    "rgb": [193, 154, 107],
  },
  "xanadu": {
    "name": "Xanadu",
    "hex": "#738678",
    "rgb": [115, 134, 120],
  },
  "yale_blue": {
    "name": "Yale Blue",
    "hex": "#0f4d92",
    "rgb": [15, 77, 146],
  },
  "yellow": {
    "name": "Yellow",
    "hex": "#ff0",
    "rgb": [255, 255, 0],
  },
  "yellow_green": {
    "name": "Yellow-Green",
    "hex": "#9acd32",
    "rgb": [154, 205, 50],
  },
  "yellow_munsell": {
    "name": "Yellow (Munsell)",
    "hex": "#efcc00",
    "rgb": [239, 204, 0],
  },
  "yellow_ncs": {
    "name": "Yellow (Ncs)",
    "hex": "#ffd300",
    "rgb": [255, 211, 0],
  },
  "yellow_orange": {
    "name": "Yellow Orange",
    "hex": "#ffae42",
    "rgb": [255, 174, 66],
  },
  "yellow_process": {
    "name": "Yellow (Process)",
    "hex": "#ffef00",
    "rgb": [255, 239, 0],
  },
  "yellow_ryb": {
    "name": "Yellow (Ryb)",
    "hex": "#fefe33",
    "rgb": [254, 254, 51],
  },
  "zaffre": {
    "name": "Zaffre",
    "hex": "#0014a8",
    "rgb": [0, 20, 168],
  },
  "zinnwaldite_brown": {
    "name": "Zinnwaldite Brown",
    "hex": "#2c1608",
    "rgb": [44, 22, 8],
  },
}
'@
    return $jsonColors | ConvertFrom-Json -Depth 99
  }
}
