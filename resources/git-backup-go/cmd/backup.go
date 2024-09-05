package cmd

import (
	"context"
	"github.com/urfave/cli/v3"
)

func BackupCommand() *cli.Command {
	return &cli.Command{
		Name:    "backup",
		Aliases: []string{"bkp"},
		Usage:   "Perform a backup",
		Action:  BackupAction(),
	}
}

func BackupAction() func(c context.Context, command *cli.Command) error {
	return func(c context.Context, command *cli.Command) error {
		return nil
	}
}
