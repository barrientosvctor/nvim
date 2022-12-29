local status, _ = pcall(require, "editorconfig")
if not status then
    print("Editorconfig is not installed.")
    return
end
