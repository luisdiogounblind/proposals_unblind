// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DarkModeController from "./dark_mode_controller"
application.register("dark-mode", DarkModeController)

import DiscountInputController from "./discount_input_controller"
application.register("discount-input", DiscountInputController)

import Editor__AutosaveController from "./editor/autosave_controller"
application.register("editor--autosave", Editor__AutosaveController)

import Editor__FormController from "./editor/form_controller"
application.register("editor--form", Editor__FormController)

import Editor__PreviewController from "./editor/preview_controller"
application.register("editor--preview", Editor__PreviewController)

import Editor__ReorderController from "./editor/reorder_controller"
application.register("editor--reorder", Editor__ReorderController)

import Editor__ResponsiveController from "./editor/responsive_controller"
application.register("editor--responsive", Editor__ResponsiveController)

import Editor__SidebarController from "./editor/sidebar_controller"
application.register("editor--sidebar", Editor__SidebarController)

import Editor__SortableController from "./editor/sortable_controller"
application.register("editor--sortable", Editor__SortableController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import SidebarController from "./sidebar_controller"
application.register("sidebar", SidebarController)

import TabsController from "./tabs_controller"
application.register("tabs", TabsController)

import TogglableController from "./togglable_controller"
application.register("togglable", TogglableController)

import Ts__TagSelectController from "./ts/tag_select_controller"
application.register("ts--tag-select", Ts__TagSelectController)
