-- Variables
local canvasSyncCallback

-- Function to register the canvas sync callback
function registerCanvasSyncCallback(callback)
  assert(type(callback) == "function", "Invalid callback provided")
  canvasSyncCallback = callback
end

-- Function to unregister the canvas sync callback
function unregisterCanvasSyncCallback()
  canvasSyncCallback = nil
end

-- Function to handle canvas updates received from peers
local function handleCanvasUpdate(message)
  -- Parse the canvas update message and apply changes to the Aseprite canvas
  -- Use the appropriate Aseprite scripting API functions to manipulate the canvas
end

-- Function to send the canvas update to connected peers
local function sendCanvasUpdate()
  -- Generate the canvas update message
  local canvasUpdateMessage = -- Create the message with relevant data
  
  -- Send the canvas update message to connected peers
  if canvasSyncCallback then
    local success, error = pcall(canvasSyncCallback, canvasUpdateMessage)
    if not success then
      print("Error invoking canvas sync callback:", error)
    end
  end
end

-- Export the functions
return {
  registerCanvasSyncCallback = registerCanvasSyncCallback,
  unregisterCanvasSyncCallback = unregisterCanvasSyncCallback,
  handleCanvasUpdate = handleCanvasUpdate,
  sendCanvasUpdate = sendCanvasUpdate
}
