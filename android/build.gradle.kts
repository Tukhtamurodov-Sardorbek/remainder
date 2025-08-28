// Runs the block for the root project and all subprojects (modules) inside android/
allprojects {
    // Tells Gradle where to download dependencies from
    repositories {
        // Google’s Maven repo — Android Gradle Plugin, AndroidX, Play services, Firebase, etc
        google()
        // General purpose Maven repo — tons of libraries live here
        mavenCentral()
    }
}

// Here, we move the build directory from the default android/build/ to ../../build (i.e., the Flutter project root’s build/), so that Android’s outputs sit alongside Flutter’s
// rootProject.layout.buildDirectory: the output folder where Gradle writes compiled classes, APKs/AABs, intermediates, etc.
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

// For every subproject (like :app, :flutter_embedding_debug, etc.), place its build outputs under the shared build dir created above, namespaced by the module name
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Forces Gradle to evaluate the :app module first before others
subprojects {
    project.evaluationDependsOn(":app")
}

// tasks.register<T>("name") is the typed way to create tasks
// It’s lazy (configured only when needed), which improves Gradle performance.
// Running ./gradlew clean will delete the custom build directory you set above
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
