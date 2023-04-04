local status, _ = pcall(require, "editorconfig")

if (not status) then
    print("EditorConfig is not installed.")
    return
end
