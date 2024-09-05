package main

import (
	"context"
	"fmt"
	"gerardnico/git-backup/cmd"
	"github.com/urfave/cli/v3"
	"log"
	"os"
	"sort"
)

var EnvPrefix string = "GITBKP"

func main() {
	var quiet bool
	flags := []cli.Flag{
		&cli.BoolFlag{
			Name:        "quiet",
			Aliases:     []string{"q"},
			Usage:       "Output only errors",
			Destination: &quiet,
			Category:    "Log:",
			Value:       false,
			Sources:     cli.EnvVars(EnvPrefix + "_QUIET"),
		},
		&cli.StringFlag{
			Name:    "config",
			Aliases: []string{"c"},
			// backtick is used as the name of the variable
			Usage:    "Load configuration from `FILE`",
			Category: "Conf:",
			Action: func(ctx context.Context, command *cli.Command, v string) error {
				if v == "" {
					return cli.Exit("config file path should not be empty", 1)
				}
				return nil
			},
		},
	}
	commands := []*cli.Command{
		cmd.ReposCommand(),
		cmd.BackupCommand(),
	}
	rootCommand := &cli.Command{
		Name:      "git-backup",
		Version:   "v1.0.0",
		Copyright: "(c) 2024 Nico",
		Usage:     "Backup Git Repositories into Rclone file system",
		Flags:     flags,
		Commands:  commands,
		// https://github.com/urfave/cli/blob/main/docs/v3/examples/bash-completions.md
		EnableShellCompletion: true,
		// combine short name options. ie allows `-it`
		// https://cli.urfave.org/v2/examples/combining-short-options/
		UseShortOptionHandling: true,
		// https://cli.urfave.org/v2/examples/bash-completions/
		Action: func(c context.Context, command *cli.Command) error {
			if quiet {
				fmt.Println("Quiet")
			}
			// There is always the 0 element (ie the executable file name)
			if len(os.Args) <= 1 {
				_ = cli.ShowAppHelp(command)
				os.Exit(1)
			}
			return nil
		},
	}

	// https://cli.urfave.org/v2/examples/suggestions/
	rootCommand.Suggest = true

	// https://cli.urfave.org/v2/examples/flags/#ordering
	sort.Sort(cli.FlagsByName(rootCommand.Flags))

	if err := rootCommand.Run(context.Background(), os.Args); err != nil {
		log.Fatal(err)
	}
}
