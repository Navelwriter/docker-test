#include <stdio.h>
#include <stdlib.h> // Required for getenv

int main() {
    printf("Hello from the project!\n");

    // Check for the RELEASE environment variable
    const char* release_env = getenv("RELEASE");

    if (release_env != NULL && strcmp(release_env, "true") == 0) {
        printf("This is a RELEASE build.\n");
    } else {
        printf("This is a standard build.\n");
    }

    return 0;
}