function Dialouge(_messages)
{
    if (variable_global_exists("dialog"))
    {
        if (instance_exists(global.dialog)) return;
    }

    global.dialog = instance_create_depth(0, 0, 0, obj_dialouge);
    global.dialog.messages = _messages;
    global.dialog.current_message = 0;
}

room1_end = [
{
    name: "Jesse",
    msg: "You have reached the next level... \nthat was unexpected hehehe."
},
{
    name: "Jesse",
    msg: "But this is not the end yet, \neven if you managed to come here, what comes next is undeniably harder... \nmuch much harder..."
},
]
welcome_dialog = [
{
    name: "Harrier",
    msg: "Are you sure you want to enter the muzzle of magnificient jaws of death?"
},
{
    name: "Gotti",
    msg: "What do you mean and why do you ask this?"
},
{
    name: "Harrier",
    msg: "What do I mean? I mean you need to be prepared for the horrors to see the stuff inside Mr. Gotti!"
},
{
    name: "Gotti",
    msg: "That doesn't sound motivating at all...."
},
{
    name: "Harrier",
    msg: "WHAT'S THAT?? WHAT AM I SEEING INSIDE.... OOH"
},   
]