x <- scan("02-05-chronological-order-plates.xml", what="char", sep = "\n")
vindplaats <- unlist(regmatches(x, gregexpr("<name[^>]+?\\>[^<]+?<\\/name>", x, perl = TRUE)))
vindplaats

periods <- gregexpr('(?<=period\\=")[^"]+(?="\\ssource)', vindplaats, perl = TRUE)
periods <- unlist(regmatches(vindplaats, periods))
periods

nummers <- gregexpr('(?<=xml\\:id\\=")[^"]+(?="\\speriod)', vindplaats, perl = TRUE)
nummers <- unlist(regmatches(vindplaats, nummers))
nummers

refs <- gregexpr('(?<=source\\=")[^"]+(?="\\>)', vindplaats, perl = TRUE)
refs <- unlist(regmatches(vindplaats, refs))
refs

vindplaats1 <- gsub("(<name[^>]+?\\>|<\\/name\\>)", "", vindplaats, perl = TRUE)

ob <- data.frame(Nummers = nummers, Vindplaats = vindplaats1, Caka = periods, Sources = refs)
ob
