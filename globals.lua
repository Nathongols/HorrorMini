
G = {}

--Development 
D_DEBUG = true
D_COLLIDERS = false -- draw colliders


G.FPS_CAP = 144
G.CANVAS_WIDTH, G.CANVAS_HEIGHT = 640, 360
--Settings 
SETTINGS = {}
SETTINGS.WINDOW = {}
SETTINGS.WINDOW.WIDTH, SETTINGS.WINDOW.HEIGHT = 1280, 720--love.window.getDesktopDimensions()
SETTINGS.WINDOW.VSYNC = false
SETTINGS.WINDOW.ACTIVE_DISPLAY = 1

--Camera Settings
SETTINGS.CAMERA = {}
SETTINGS.CAMERA.FOLLOW_STRENGTH = 0.1 --acceleration for camera to player
--Objects
G.O_ID = 0 --ID of the object, gets incremented for each new object, used for lookup deletion
G.O_Nodes = {} --All nodes instantiated in the game
G.O_Drawables = {} --all drawable objects
G.O_Luigis = {} -- the bouncy guys you have to click on 
G.O_Wanted = {} -- the character that you must click (waldo)
--Time
T_ELAPSED_TIME = 0



--UI

G.U_Select = {} -- holds gun selection ui