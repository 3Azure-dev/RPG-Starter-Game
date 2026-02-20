if (instance_exists(obj_dialouge)) {
    can_talk = false;
    exit;
}

if (instance_exists(obj_player) && distance_to_object(obj_player) < 12)
{
    can_talk = true;

    if (keyboard_check_pressed(input_key))
    {
        Dialouge(Dialog);
        
        if(final_npc) obj_dialouge.next_room = true;
    }
}
else
{
    can_talk = false;
}