x <- scan("02-05-chronological-order-plates.xml", what="char", sep = "\n")
vindplaats <- unlist(regmatches(x, gregexpr("<name[^>]+?\\>[^<]+?<\\/name>", x, perl = TRUE)))
vindplaats

periods <- gregexpr('(?<=period\\=")[^"]+(?="\\ssource)', vindplaats, perl = TRUE)
periods <- unlist(regmatches(vindplaats, periods))
periods
periods_fct <- factor(periods, level = periods)

nummers <- gregexpr('(?<=xml\\:id\\=")[^"]+(?="\\speriod)', vindplaats, perl = TRUE)
nummers <- unlist(regmatches(vindplaats, nummers))
nummers
nummers_fct <- factor(nummers, level = nummers)

refs <- gregexpr('(?<=source\\=")[^"]+(?="\\>)', vindplaats, perl = TRUE)
refs <- unlist(regmatches(vindplaats, refs))
refs

vindplaats1 <- gsub("(<name[^>]+?\\>|<\\/name\\>)", "", vindplaats, perl = TRUE)

ob <- data.frame(Nummers = nummers_fct, Vindplaats = vindplaats1, Caka = periods, Sources = refs)
ob
write.table(ob, file = "02-05-chronological-order-plates-tbl.tsv", sep = "\t", row.names = FALSE, col.names = TRUE)
saveRDS(ob, file = "02-05-chronological-order-plates-tbl.rds")