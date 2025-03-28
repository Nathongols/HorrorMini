
G = {}

--Development 
D_DEBUG = true
D_COLLIDERS = false -- draw colliders

G.FPS_CAP = 14400
G.CANVAS_WIDTH, G.CANVAS_HEIGHT = 640, 360
--Settings 
SETTINGS = {}
SETTINGS.WINDOW = {}
SETTINGS.WINDOW.WIDTH, SETTINGS.WINDOW.HEIGHT =  1280, 720--love.window.getDesktopDimensions()
SETTINGS.WINDOW.VSYNC = false
SETTINGS.WINDOW.ACTIVE_DISPLAY = 1

--Canvas Settings
G.C_Canvases = {}
G.C_Offset = {x = 100, y = 100}
--Camera Settings
SETTINGS.CAMERA = {}
SETTINGS.CAMERA.FOLLOW_STRENGTH = 0.1 --acceleration for camera to player
--Objects
G.O_ID = 0 --ID of the object, gets incremented for each new object, used for lookup deletion
G.O_Nodes = {} --All nodes instantiated in the game
G.O_Drawables = {} --all drawable objects
G.O_Luigis = {} -- the bouncy guys you have to click on 
G.O_Wanted = {} -- the character that you must click (waldo)
G.L_Stage1List = {}

G.O_Timer = {}
G.O_Doctor = nil 
--Time
T_ELAPSED_TIME = 0



--UI

G.U_Elements = {} -- holds ui