-- Variables
local tabShareCallback

-- Function to register the tab share callback
function registerTabShareCallback(callback)
  assert(type(callback) == "function", "Invalid callback provided")
  tabShareCallback = callback
end

-- Function to unregister the tab share callback
function unregisterTabShareCallback()
  tabShareCallback = nil
end

-- Function to share a tab with connected peers
local function shareTab(tab)
  -- Serialize the tab data into a shareable format
  local tabData = -- Serialize the tab data into a string or table
  
  -- Send the tab data to connected peers
  if tabShareCallback then
    local success, error = pcall(tabShareCallback, tabData)
    if not success then
      print("Error invoking tab share callback:", error)
    end
  end
end

-- Function to handle receiving a shared tab from peers
local function receiveSharedTab(tabData)
  -- Deserialize the tab data and create a new tab from it
  local tab = -- Deserialize the tab data and create a new tab object
  
  -- Show the shared tab in the Aseprite workspace
  if tab then
    tab:show()
  end
end

-- Export the functions
return {
  registerTabShareCallback = registerTabShareCallback,
  unregisterTabShareCallback = unregisterTabShareCallback,
  shareTab = shareTab,
  receiveSharedTab = receiveSharedTab
}
