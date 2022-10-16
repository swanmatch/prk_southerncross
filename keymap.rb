# Initialize a Keyboard
kbd = Keyboard.new

kbd.init_direct_pins(
  # {{ B3, B1, D7, B4 }, { B6, B2, E6, B5 }}
  [ 20, 22, 6, 8, 21, 23, 7, 9 ]
)


kbd.add_layer :default, %i[
  COPY         SELALL  SAVE     PASTE
  BKSP_LEFT    UNDO    REDO     DEL_RIGHT
]

kbd.add_layer :layer1, %i[
  KC_1         NAME  EMAIL      KC_3
  BKSP_LEFT    URL   TWITTER    DEL_RIGHT
]

kbd.add_layer :layer2, %i[
  KC_A         KC_B  KC_C       KC_D
  BKSP_LEFT    KC_E  KC_F       DEL_RIGHT
]

# Ctrl and others
kbd.define_mode_key :SELALL, [ %i[KC_RCTL KC_A], nil, 200, 200 ]
kbd.define_mode_key :SAVE,   [ %i[KC_RCTL KC_S], nil, 200, 200 ]
kbd.define_mode_key :UNDO,   [ %i[KC_RCTL KC_Z], nil, 200, 200 ]
kbd.define_mode_key :REDO,   [ %i[KC_RCTL KC_Y], nil, 200, 200 ]
kbd.define_mode_key :COPY,   [ %i[KC_RCTL KC_C], nil, 200, 200 ]
kbd.define_mode_key :PASTE,  [ %i[KC_RCTL KC_V], nil, 200, 200 ]

# when tap any key, and Hold move layer
kbd.define_mode_key :BKSP_LEFT,    [ :KC_BKSP,            :layer1,  200, 200 ]
kbd.define_mode_key :DEL_RIGHT,    [ :KC_RIGHT,           :layer2,  200, 200 ]

# Macros
name    = "swan_match"
email   = "swan_match@yahoo.co.jp"
url     = "https://royal-keyboard-works.square.site/"
twitter = "https://twitter.com/swan_match"

kbd.define_mode_key :NAME,    [ Proc.new { kbd.macro(name)    },   nil,  200, nil ]
kbd.define_mode_key :EMAIL,   [ Proc.new { kbd.macro(email)   },   nil,  200, nil ]
kbd.define_mode_key :URL,     [ Proc.new { kbd.macro(url)     },   nil,  200, nil ]
kbd.define_mode_key :TWITTER, [ Proc.new { kbd.macro(twitter) },   nil,  200, nil ]

rgb = RGB.new(
  0,    # pin number
  0,    # size of underglow pixel
  4,    # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)


rgb.effect = :swirl
rgb.speed = 25
# rgb.effect = :breathing
# Set an action when you input
#  `nil` or `:off` for turning off
# rgb.action = :thunder
# Append the feature. Will possibly be able to write `Keyboard#append(OLED.new)` in the future
kbd.append rgb

kbd.start!

