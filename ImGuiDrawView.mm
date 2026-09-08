#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
//Imgui library
#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/Honkai.h"
//Patch library
#import "5Toubun/NakanoIchika.h"
#import "5Toubun/NakanoNino.h"
#import "5Toubun/NakanoMiku.h"
#import "5Toubun/NakanoYotsuba.h"
#import "5Toubun/NakanoItsuki.h"
#import "5Toubun/dobby.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

/*
    Components:
 
 - Metal: The code leverages the Metal framework for graphics rendering and GPU acceleration.
 - ImGui: The ImGui library is used to create and manage the graphical elements of the application's user interface.
 - Patch Library: Various patching and hooking functions are employed to modify the behavior of the target application dynamically.
 - Touch Event Handling: The code handles touch events to allow user interactions with the GUI.
 
 Key Features:
 
 - The `MenDeal` 
