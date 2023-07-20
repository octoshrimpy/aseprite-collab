-- Import necessary modules
local WebSocket = require("your_websocket_library")

-- Constants
local WEBSOCKET_PORT = 9000 -- Customize the port number as per your needs

-- Variables
local websocketServer

-- WebSocket callback function
local function onReceiveWebSocketMessage(messageType, data)
  -- Handle incoming WebSocket messages here
  -- Parse the message and update the canvas accordingly
end

-- Function to create WebSocket server
function createWebSocketServer()
  websocketServer = WebSocket.server({ port = WEBSOCKET_PORT })
  websocketServer:listen(function(socket)
    -- New WebSocket connection received
    socket:on("message", function(data)
      -- Handle incoming messages from connected peers
      onReceiveWebSocketMessage("text", data)
    end)
  end)
end

-- Function to connect to WebSocket server
function connectToWebSocketServer(serverURL)
  local websocketClient = WebSocket.client(serverURL)
  websocketClient:on("open", function()
    -- Connection established with another peer
    -- You can send an initial handshake message or perform other setup tasks here
  end)
  websocketClient:on("message", function(data)
    -- Handle incoming messages from connected peers
    onReceiveWebSocketMessage("text", data)
  end)
end

-- Function to close WebSocket server
function closeWebSocketServer()
  if websocketServer then
    websocketServer:close()
    websocketServer = nil
  end
end

-- Function to send message over WebSocket
function sendMessage(message)
  -- Send the message to the connected peers
  if websocketServer then
    websocketServer:sendText(message)
  end
end

-- Export the functions
return {
  createWebSocketServer = createWebSocketServer,
  connectToWebSocketServer = connectToWebSocketServer,
  closeWebSocketServer = closeWebSocketServer,
  sendMessage = sendMessage
}
