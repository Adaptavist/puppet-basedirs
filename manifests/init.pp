class basedirs(
    $directories = {
            '/opt' => {
                'ensure' => 'directory',
                'owner'  => 'root',
                'group'  => 'root',
                'mode'   => 755,
                }
        },
    ) {
    create_resources(file, $directories)
}
