function showCollaborationModeDialog(isCollabModeEnabled)
  local dlg = Dialog()
  
  local data = dlg.data

  dlg:canvas{width=300}

  dlg:check{
    id = "collab_enabled",
    label = "Enable Collab Mode",
    text = "Collab Mode",
    selected = isCollabModeEnabled,
    onclick = function()
      local data = dlg.data
      local collabEnabled = data.collab_enabled or false

      -- Enable/Disable the P2P URL entry based on the checkbox status
      dlg:modify{
        id = "p2p_url",
        enabled = collabEnabled
      }
      
      dlg:modify{
        id = "user_p2p_url",
        enabled = collabEnabled
      }

      if collabEnabled then
        data.p2p_url = ""
        dlg:modify{
          id = "p2p_url",
          text = data.p2p_url
        }
        
        data.user_p2p_url = "this_is_your_url"
        dlg:modify{
          id = "user_p2p_url",
          text = data.user_p2p_url
        }
      end

      if not collabEnabled then
        data.p2p_url = "Enter P2P URL here"
        dlg:modify{
          id = "p2p_url",
          text = data.p2p_url
        }
        
        data.user_p2p_url = "No URL generated"
        dlg:modify{
          id = "user_p2p_url",
          text = data.user_p2p_url
        }
      end
      
    end
  }

  dlg:entry{
    id = "p2p_url",
    label = "P2P URL:",
    text = data.p2p_url or "Enter P2P URL here",
    enabled = isCollabModeEnabled,
    focus = true,
    }

  dlg:entry{
    id = "user_p2p_url",
    label = "Your P2P URL:",
    text = data.user_url or "No URL generated",
    enabled = isCollabModeEnabled,
    focus = true,
      
  }

  dlg:button{
    id = "confirm",
    text = "Connect"
  }

  dlg:show()

  return dlg.data
end

return {
  showCollaborationModeDialog = showCollaborationModeDialog
}
