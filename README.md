# KillFrenzy's Avatar Keyboard
A custom avatar keyboard that takes advantage of parameter sync. Also includes a custom marker and works in Desktop mode.

Installation Instructions are a work in progress. YouTube tutorial will be released soon.

# Prerequisites
- Unity 2018.4.20f1
- VRCSDK3
- An existing working avatar (if installing to your own custom avatar)

# Uploading the Example Avatar
1. Import the "KillFrenzyKeyboard.unitypackage" into your project.
2. Open the scene located in "Assets/KillFrenzy/Animations/Keyboard/Examples/ExampleAvatar.unity".
3. Open the VRCSDK Control Panel and login to your account.
4. Build & Publish the "Vrchat_Tutorial_Avatar" model.

# Installation to Custom Avatar
1. Import the "KillFrenzyKeyboard.unitypackage" into your project.
2. Insert the prefab into your scene. The prefab is located in "Assets/KillFrenzy/Animations/Keyboard/Examples/AvatarKeyboardParts.unity".
3. Unpack the prefab by right clicking "AvatarKeyboardParts" and pressing "Unpack Prefab".
4. Move the game object from "ArmatureAndThat/Chest/Joint_KeyboardHeight" into your own avatar's chest. Reset its transform (position/rotation) to 0,0,0.
5. Move the game object from "ArmatureAndThat/Left wrist/Joint_Marker_L" into your own avatar's left wrist. Position this object over the tip of your avatar's left index finger.
6. Move the game object from "ArmatureAndThat/Right wrist/Joint_Marker_R" into your own avatar's right wrist. Position this object over the tip of your avatar's right index finger.
7. Move the game object from "ArmatureAndThat/Left wrist/IndexFinger3_L_end/Joint_KeyboardCollider_L" into the end of your own avatar's left index finger. Position this object over the tip of your avatar's left index finger.
8. Move the game object from "ArmatureAndThat/Right wrist/IndexFinger3_R_end/Joint_KeyboardCollider_R" into the end of your own avatar's right index finger. Position this object over the tip of your avatar's right index finger.
9. Position the game object inside "ArmatureAndThat/Head2/Joint_DesktopAim" over the avatar's eye position. You should use the same position as the avatar's view position.
10. Browse to the neck bone of your own avatar. Make a duplicate of the neck bone.
11. Add a rotation constraint to the duplicated neck bone. Add the original neck bone into the Sources. Activate the constraint.
12. Add a rotation constraint to the duplicated head bone (inside of of the duplicated neck bone). Add the original head bone into the Sources. Activate the constraint.
13. Delete all game objects that may be inside the duplicated head bone.
14. Move the game object from "ArmatureAndThat/Right wrist/Joint_DesktopAim" into the duplicated head bone.
15. Browse to your VRC Avatar Descriptor.
16. Customize your PlayableLayers.
17. Insert the animator controller from "Assets/KillFrenzy/Animations/Keyboard/VRCAC_KeyboardControllerAction" into the Action layer.
18. Customize your Expressions.
19. Insert the VRC Expression Menu from "Assets/KillFrenzy/Animations/Keyboard/VRCAC_KeyboardMenu" into the the Menu.
20. Insert the VRC Expression Paramaters from "Assets/KillFrenzy/Animations/Keyboard/VRCAC_KeyboardParams" into the the Parameters.
21. Move the game object "KillFrenzyKeyboardEffects" into the root of your own avatar.
22. Open the VRCSDK Control Panel and login to your account.
23. Build & Publish your custom model.
