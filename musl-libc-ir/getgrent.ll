; ModuleID = 'src/passwd/getgrent.c'
source_filename = "src/passwd/getgrent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque
%struct.group = type { i8*, i8*, i32, i8** }

@f = internal unnamed_addr global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [11 x i8] c"/etc/group\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1
@gr = internal global %struct.group zeroinitializer, align 8
@line = internal global i8* null, align 8
@mem = internal global i8** null, align 8

@endgrent = weak alias void (), void ()* @setgrent

; Function Attrs: nounwind optsize strictfp
define void @setgrent() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %1) #3
  br label %5

5:                                                ; preds = %3, %0
  store %struct._IO_FILE* null, %struct._IO_FILE** @f, align 8, !tbaa !3
  ret void
}

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define %struct.group* @getgrent() local_unnamed_addr #0 {
  %1 = alloca %struct.group*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = bitcast %struct.group** %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = bitcast i64* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  store i64 0, i64* %2, align 8, !tbaa !7
  %6 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #4
  store i64 0, i64* %3, align 8, !tbaa !7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %8 = icmp eq %struct._IO_FILE* %7, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %0
  %10 = tail call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #3
  store %struct._IO_FILE* %10, %struct._IO_FILE** @f, align 8, !tbaa !3
  %11 = icmp eq %struct._IO_FILE* %10, null
  br i1 %11, label %16, label %12

12:                                               ; preds = %0, %9
  %13 = phi %struct._IO_FILE* [ %10, %9 ], [ %7, %0 ]
  %14 = call i32 @__getgrent_a(%struct._IO_FILE* noundef nonnull %13, %struct.group* noundef nonnull @gr, i8** noundef nonnull @line, i64* noundef nonnull %2, i8*** noundef nonnull @mem, i64* noundef nonnull %3, %struct.group** noundef nonnull %1) #3
  %15 = load %struct.group*, %struct.group** %1, align 8, !tbaa !3
  br label %16

16:                                               ; preds = %9, %12
  %17 = phi %struct.group* [ %15, %12 ], [ null, %9 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret %struct.group* %17
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__getgrent_a(%struct._IO_FILE* noundef, %struct.group* noundef, i8** noundef, i64* noundef, i8*** noundef, i64* noundef, %struct.group** noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define %struct.group* @getgrgid(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.group*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = bitcast %struct.group** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  %6 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #4
  store i64 0, i64* %3, align 8, !tbaa !7
  %7 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #4
  store i64 0, i64* %4, align 8, !tbaa !7
  %8 = call i32 @__getgr_a(i8* noundef null, i32 noundef %0, %struct.group* noundef nonnull @gr, i8** noundef nonnull @line, i64* noundef nonnull %3, i8*** noundef nonnull @mem, i64* noundef nonnull %4, %struct.group** noundef nonnull %2) #3
  %9 = load %struct.group*, %struct.group** %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  ret %struct.group* %9
}

; Function Attrs: optsize
declare hidden i32 @__getgr_a(i8* noundef, i32 noundef, %struct.group* noundef, i8** noundef, i64* noundef, i8*** noundef, i64* noundef, %struct.group** noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define %struct.group* @getgrnam(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.group*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = bitcast %struct.group** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  %6 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #4
  store i64 0, i64* %3, align 8, !tbaa !7
  %7 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #4
  store i64 0, i64* %4, align 8, !tbaa !7
  %8 = call i32 @__getgr_a(i8* noundef %0, i32 noundef 0, %struct.group* noundef nonnull @gr, i8** noundef nonnull @line, i64* noundef nonnull %3, i8*** noundef nonnull @mem, i64* noundef nonnull %4, %struct.group** noundef nonnull %2) #3
  %9 = load %struct.group*, %struct.group** %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  ret %struct.group* %9
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !5, i64 0}
