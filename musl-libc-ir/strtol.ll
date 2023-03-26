; ModuleID = 'src/stdlib/strtol.c'
source_filename = "src/stdlib/strtol.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__strtol_internal = weak alias i64 (i8*, i8**, i32), i64 (i8*, i8**, i32)* @strtol
@__strtoul_internal = weak alias i64 (i8*, i8**, i32), i64 (i8*, i8**, i32)* @strtoul
@__strtoll_internal = weak alias i64 (i8*, i8**, i32), i64 (i8*, i8**, i32)* @strtoll
@__strtoull_internal = weak alias i64 (i8*, i8**, i32), i64 (i8*, i8**, i32)* @strtoull
@__strtoimax_internal = weak alias i64 (i8*, i8**, i32), i64 (i8*, i8**, i32)* @strtoimax
@__strtoumax_internal = weak alias i64 (i8*, i8**, i32), i64 (i8*, i8**, i32)* @strtoumax

; Function Attrs: nounwind optsize strictfp
define i64 @strtoull(i8* noalias noundef %0, i8** noalias noundef %1, i32 noundef %2) #0 {
  %4 = tail call fastcc i64 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef %2, i64 noundef -1) #3
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i64 @strtox(i8* noundef %0, i8** noundef writeonly %1, i32 noundef %2, i64 noundef %3) unnamed_addr #0 {
  %5 = alloca %struct._IO_FILE, align 8
  %6 = bitcast %struct._IO_FILE* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %6) #4
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 1
  store i8* %0, i8** %7, align 8, !tbaa !3
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 11
  store i8* %0, i8** %8, align 8, !tbaa !10
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 2
  store i8* inttoptr (i64 -1 to i8*), i8** %9, align 8, !tbaa !11
  call void @__shlim(%struct._IO_FILE* noundef nonnull %5, i64 noundef 0) #5
  %10 = call i64 @__intscan(%struct._IO_FILE* noundef nonnull %5, i32 noundef %2, i32 noundef 1, i64 noundef %3) #5
  %11 = icmp eq i8** %1, null
  br i1 %11, label %22, label %12

12:                                               ; preds = %4
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %5, i64 0, i32 27
  %14 = load i64, i64* %13, align 8, !tbaa !12
  %15 = load i8*, i8** %7, align 8, !tbaa !3
  %16 = load i8*, i8** %8, align 8, !tbaa !10
  %17 = ptrtoint i8* %15 to i64
  %18 = ptrtoint i8* %16 to i64
  %19 = add i64 %14, %17
  %20 = sub i64 %19, %18
  %21 = getelementptr inbounds i8, i8* %0, i64 %20
  store i8* %21, i8** %1, align 8, !tbaa !13
  br label %22

22:                                               ; preds = %12, %4
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %6) #4
  ret i64 %10
}

; Function Attrs: nounwind optsize strictfp
define i64 @strtoll(i8* noalias noundef %0, i8** noalias noundef %1, i32 noundef %2) #0 {
  %4 = tail call fastcc i64 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef %2, i64 noundef -9223372036854775808) #3
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @strtoul(i8* noalias noundef %0, i8** noalias noundef %1, i32 noundef %2) #0 {
  %4 = tail call fastcc i64 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef %2, i64 noundef -1) #3
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @strtol(i8* noalias noundef %0, i8** noalias noundef %1, i32 noundef %2) #0 {
  %4 = tail call fastcc i64 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef %2, i64 noundef -9223372036854775808) #3
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @strtoimax(i8* noalias noundef %0, i8** noalias noundef %1, i32 noundef %2) #0 {
  %4 = tail call fastcc i64 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef %2, i64 noundef -9223372036854775808) #5
  ret i64 %4
}

; Function Attrs: nounwind optsize strictfp
define i64 @strtoumax(i8* noalias noundef %0, i8** noalias noundef %1, i32 noundef %2) #0 {
  %4 = tail call fastcc i64 @strtox(i8* noundef %0, i8** noundef %1, i32 noundef %2, i64 noundef -1) #5
  ret i64 %4
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__shlim(%struct._IO_FILE* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__intscan(%struct._IO_FILE* noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 88}
!11 = !{!4, !8, i64 16}
!12 = !{!4, !9, i64 200}
!13 = !{!8, !8, i64 0}
