"""
    command!(p::CanvasPlot,cmd)

Enter new command named `cmd`.

The idea is to pass one single Dict
with all plot data to javascript.

For this purpose we need a some "language".

Plot elements are described by commands executed
one after another. For this purpose, we use 
integers converted to strings as dict keys and pass the command
name as the corresponding entry.

The entry `cmdcount` keeps track of the number of
commands. So we can parse all commands from 1 to jsdict[:cmdcount]
in javascript in the same sequence as they have been entered.

Parameters are named and entered into the dictionary with the 
command number as prefix.

E.g. for a polyline as command number 5, we create the entres

```
"5" => "polyline"
"5_x" => Vector of x coordinates in canvas coordinate system
"5_y" => Vector of y coordinates in canvas coordinate system
"""
function command!(p,cmd)
    p.jsdict["cmdcount"]=p.jsdict["cmdcount"]+1
    pfx=string(p.jsdict["cmdcount"])
    p.jsdict[pfx]=cmd
    pfx
end
