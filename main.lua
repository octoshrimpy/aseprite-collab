-- Import necessary modules
local dialog = dofile("dialog.lua")
local tabShare = dofile("tab_share.lua")
-- local websocket = dofile("websocket.lua")
-- local canvasSync = dofile("canvas_sync.lua")

-- Global variables
local isCollabModeEnabled = false
local webRTCProcess

-- Function to handle collaboration mode toggle
local function toggleCollabMode()
  local data = dialog.showCollaborationModeDialog(isCollabModeEnabled)

  if data then
    isCollabModeEnabled = data.collab_enabled or false

    if isCollabModeEnabled then
      -- Enable collaboration mode
      -- dialog.showCollabEnabledDialog()

      -- Start WebSocket server
      -- websocket.createWebSocketServer()

      -- Register canvas sync callback
      -- canvasSync.registerCanvasSyncCallback(websocket.sendMessage)

      -- Register tab share callback
      -- tabShare.registerTabShareCallback(websocket.sendMessage)

      -- Launch WebRTC process
      -- webRTCProcess = app.shell_execute("node webRTC.js")
    else
      -- Disable collaboration mode
      -- dialog.showCollabDisabledDialog()

      -- Close WebSocket server
      -- websocket.closeWebSocketServer()

      -- Unregister canvas sync callback
      -- canvasSync.unregisterCanvasSyncCallback()

      -- Unregister tab share callback
      -- tabShare.unregisterTabShareCallback()

      -- Terminate WebRTC process
      -- if webRTCProcess then
      --   app.shell_terminate(webRTCProcess)
      --   webRTCProcess = nil
      -- end
    end
  end
end

-- Entry point for the Aseprite plugin
function init(plugin)
  plugin:newCommand{
    id = "collab_mode",
    title = "Collaboration Mode",
    group = "edit_fill",
    onclick = toggleCollabMode,
  }
end

function exit(plugin) end
